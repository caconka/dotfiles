# Mutt

## How to encrypt

```
$ gpg --gen-key
$ gpg -r your.email@example.com -e ~/.mutt/inc/pss
$ rm ~/.mutt/inc/passwords
```
