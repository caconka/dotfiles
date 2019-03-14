# Mutt

## How to encrypt passwords

```
$ gpg --gen-key
$ gpg -r your.email@example.com -e ~/.mutt/inc/passwords
$ rm ~/.mutt/inc/passwords
```
