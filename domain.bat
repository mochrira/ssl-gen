@ECHO off
set OPENSSL_CONF=D:\sistem\apache\conf\openssl.cnf
set openssl=D:\sistem\apache\bin\openssl.exe
set certPath=D:\sistem\apache\ssl
set extPath=D:\sistem\apache\ssl\ext
set newLine=^& echo.
%openssl% req -new -nodes -newkey rsa:2048 -keyout "%certPath%\%1.key" -out "%certPath%\%1.csr" -subj "/C=ID/ST=EastJava/L=Banyuwangi/O=%1-Cert/CN=%1"
(echo authorityKeyIdentifier = keyid,issuer %newLine%keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment %newLine%subjectAltName = @alt_names %newLine%[alt_names] %newLine%DNS.1 = %1) > "%extPath%\%1.ext"
%openssl% x509 -req -sha256 -days 1024 -in "%certPath%\%1.csr" -CA "%certPath%\%2.pem" -CAkey "%certPath%\%2.key" -CAcreateserial -extfile "%extPath%\%1.ext" -out "%certPath%\%1.crt"
PAUSE