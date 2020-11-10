# Windows SSL Certificate Generator

## Setup

```
$ git clone https://github.com/mochrira/ssl-gen.git
```

## Configuring

Open domain.bat and root-ca.bat, then configure with following rules
- Change openssl with your apache openssl path, usually on your_apache_dir\bin\openssl.exe
- Change certPath with your own certificate path, its free to place everywhere
- Then, change extPath with your own certificate ext path, its also free to place everywhere

## RootCA

```
$ cd ssl-gen
$ .\root-ca.bat RootCA-Cert RootCA
```

Then install your RootCA, open your certPath with windows explorer then right-click RootCA.crt (windows will recognize it with certificate icon). Then click "Install Certificate", and make sure you choose "Trusted Root Certificate Authorities" for your certificate store

## Domain Certificate

```
$ .\domain.bat localhost
```

Then, with your apache ssl module enabled, include ssl certificate (localhost.crt) and ssl certificate key file (localhost.key).

```
<VirtualHost *:443>
    ServerName localhost
    DocumentRoot "your_localhost_doc_root"
    
    SSLEngine on
    SSLCertificateFile "your_certPath\localhost.crt"
    SSLCertificateKeyFile "your_certPath\localhost.key"
</VirtualHost>
```