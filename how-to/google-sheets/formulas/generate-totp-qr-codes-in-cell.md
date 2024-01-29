# Google Sheet TOTP QR generator

Generate a QR Code on the selected cell to Register a TOTP code in Authentication App

- Set a column for the ISSUER
- Set a column for the SECRET CODE / TOKEN
- Replace the ISSUER and SECRETCODE variables from the Formula with the Cell ID

```
=IMAGE("https://www.google.com/chart?chs=500x500&chld=M|0&cht=qr&chl=otpauth://totp/"&ENCODEURL(ISSUER)&"?secret="&SECRETCODE&"&issuer="&ENCODEURL(ISSUER)&"&algorithm=SHA1&digits=6&period=30")
```