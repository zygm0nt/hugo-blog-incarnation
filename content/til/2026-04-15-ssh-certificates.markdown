---
title: "SSH certificates: the better SSH experience"
date: 2026-04-15
tags:
    - ssh
    - security
    - devops
---

Inspired by [this post by JP Mens](https://jpmens.net/2026/04/03/ssh-certificates-the-better-ssh-experience/).

Instead of distributing public keys to every server's `authorized_keys`, you
can use a Certificate Authority (CA) to sign SSH keys. This eliminates
`ssh-copy-id`, manual `authorized_keys` edits, and TOFU prompts for new hosts.

**How it works:**

1. Create a CA key pair on a secure machine
   ```sh
   umask 077; mkdir CA
   ssh-keygen -t ecdsa -C "My SSH CA" -f CA/ssh-ca
   ```

2. Sign user public keys with the CA, specifying allowed principals (login names)
   ```sh
   # user generates their own key first
   ssh-keygen -t ecdsa -C "Jane's key" -f jane
   # CA signs it: -I identity, -n principal (unix login), -V validity
   ssh-keygen -s CA/ssh-ca -I "Jane Jolie" -n jane -V +1w jane.pub
   ```

3. Sign host public keys with the CA, specifying validity periods
   ```sh
   # on the CA machine, after receiving the server's host public key
   ssh-keygen -h -s CA/ssh-ca -V +52w -I server01 -n alice.example.com \
     ssh_host_ed25519_key.pub
   ```

4. On servers: point `sshd_config` at the CA's public key and the signed host cert
   ```sh
   # install CA pubkey and signed host cert
   install -m444 ssh-ca.pub /etc/ssh/ssh-ca.pub
   install -m444 ssh_host_ed25519_key-cert.pub /etc/ssh/ssh_host_ed25519_key-cert.pub
   # add to sshd_config
   echo "TrustedUserCAKeys /etc/ssh/ssh-ca.pub" >> /etc/ssh/sshd_config
   echo "HostCertificate /etc/ssh/ssh_host_ed25519_key-cert.pub" >> /etc/ssh/sshd_config
   systemctl restart sshd
   ```

5. On clients: add one `@cert-authority` line to `known_hosts`
   ```sh
   echo "@cert-authority *.example.com $(cat CA/ssh-ca.pub)" >> ~/.ssh/known_hosts
   ```

**What you get:**

- No more per-server key deployment
- Certificates expire automatically
- Host key rotation without client warnings
- Optional: IP restrictions, forced commands per certificate
