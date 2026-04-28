
---
title: "paper-age"
date: 2026-04-28T00:00:00Z
comments: true
tags:
    - security
    - it

---

My laptop is gone. My password manager database lives in the cloud - but the cloud storage password is a random 40-character string that only exists inside that password manager. Classic chicken-and-egg. My solution: print the password on paper, encrypted.

[`paper-age`]([https://github.com/matiaskorhonen/paper-age]) is a tool that takes any secret and produces a printable PDF containing a QR code with the data encrypted using [age](https://age-encryption.org/) - passphrase-based symmetric encryption. One passphrase to remember, everything else on paper.

I put my cloud credentials into `in.txt`, then run:

```
gzip --best --stdout in.txt |
   paper-age --output=compressed.pdf --title="my cloud storage"
```

The tool prompts for a passphrase, then generates a PDF. I print it and store it somewhere physical and safe.

![Image](/post_images/til-paper-age-0.png)

To recover, I scan the QR code, which gives me the age-encrypted ciphertext. Then:

```
echo <ciphertext> | base64 -d | age --decrypt > in.txt
```

That decrypts back to the original `in.txt`, giving me my credentials to access the cloud backup and rebuild from there.

One passphrase kept in my head. Everything else recoverable from a printed sheet.
