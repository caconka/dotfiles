# Mutt

## How to encrypt

```
$ gpg --gen-key
$ gpg -r your.email@example.com -e ~/.mutt/inc/pss
$ rm ~/.mutt/inc/pss
```

### pss file

```
set imap_pass = ""
set smtp_pass = ""
```
