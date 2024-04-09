---
title: "Git - conditional configs and commit signing"
date: 2024-03-28T00:00:00Z
url: /2024/03/28/git-conditional
draft: false
comments: true
categories:
    - it
    - security
    - git

---

![An illustration depicting the concept of Git - conditional configurations and commit signing. Visualize a desktop with a computer screen displaying a stylized Git interface, highlighting conditional configurations. On the desk, there is a digital signature pad with a stylized pen on top, symbolizing commit signing. The background should subtly include digital elements and code snippets related to Git operations, creating an atmosphere that speaks to software development and version control. The color palette should be modern and tech-oriented, with blues, greens, and grays dominating.](/post_images/2024-03-28-git-conditional/git_conditional.webp)


Recently I came across two very interesting options in `git` that I wanted to make a note of.

One is a general feature - conditional configs - that you can probably utilise in a myriad of ways. 
The second - commit signing - might seem a bit obscure.

## Conditional configs

It appears it's really easy to put conditional properties into your `.gitconfig` file. This way, you can have a separate entities depending on which repositories you commit to.
It enables work/hobby project separation. With this setup in place I don't need to ever remember about switching email accounts, or other specific configs.

And it's really simple! Look:

```
[includeIf "hasconfig:remote.*.url:git@ssh.gitlab.your-company.io:**/**"]
    path = work.local  
```

So, this piece of config, when put into `.gitconfig`, will check in what repository are you, if its remote address matches this expression, in which case it will include some specific config file. 

And of course you can put a multitude of custom options. Starting with your work e-mail, so as not to pollute work repos with some private email aliases.

## Commit signing

That, I'm not so sure it's necessary. I haven't been obliged by any company I've worked for to do this step, but it's generally about vouching for your own commits with some cryptograhic signature. 

On one hand this might seem like an overkill. But on the other, this is really easy to do. And once done, it does not require any further maintenance. Also, with the proliferation of security issues cropping up all over the places, maybe it's just a good habit to start signing your commits. When signed, it will be possible to *verify* them at some point. 

I'll build upon the previous conditional config, and show how this exact config can look like, when written to an external, work related config file:

```
[user]
	email = marcin.cylke@XYZ.com
	signingkey = /Users/marcin.cylke/.ssh/id_rsa.pub
[gpg "ssh"] 
    allowedSignersFile = "/Users/marcin.cylke/.ssh/allowed_signers"

[commit]
    gpgSign = true

[tag]
    gpgSign = true 

[gpg]
    format = ssh  
```


Of course, you could set this up with `gpg` - but my trust in this tool is not exactly stellar. `ssh` is just easier for me and more accessible.
If your key has a password set (**which it should!**), you'll be prompted for that. But using some agent to store passwords on your machine will cache that for some specified time, making the process even less cumbersome.

### How to check if a commit is verified (Web UI)

If you're using GitHub or GitLab verified commits are marked appropriately (both images are taken from documentation):

* GitHub
![github illustration](/post_images/2024-03-28-git-conditional/Pasted_image_20240328230239.png)

* GitLab
![gitlab illustration](/post_images/2024-03-28-git-conditional/Pasted_image_20240328230351.png)

### How to check if a commit is verified (local)

You need to have `allowed_signers` file:

```
echo "$(git config --get user.email) namespaces=\"git\" $(cat ~/.ssh/id_rsa.pub)" >> ~/.ssh/allowed_signers
```

In the CLI, you can just call:

```
$ git verify-commit abc1234
```

or to be more verbose:

```
$ git log --show-signature

commit e2406b6cd8ebe146835ceab67ff4a5a116e09154 (HEAD -> main, origin/main, origin/HEAD)
Good "git" signature for johndoe@example.com with ED25519 key SHA256:Ar44iySGgxic+U6Dph4Z9Rp+KDaix5SFGFawovZLAcc
Author: John Doe <johndoe@example.com>
Date:   Tue Nov 29 06:54:15 2022 -0600

    SSH signed commit
```

## Conclusion

These are just two random options that I came across. I bet there's a lot more. If you think some would be of use in my case, please share!

Also, if you see some interesting use-cases for the above two - let me know, maybe this blogpost can have more details, or examples.



Links:
* Gitlab: https://docs.gitlab.com/ee/user/project/repository/signed_commits/ssh.html
* GitHub: https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification
