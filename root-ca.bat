@ECHO OFF
set OPENSSL_CONF=D:\sistem\apache\conf\openssl.cnf
set openssl=D:\sistem\apache\bin\openssl.exe
set certPath=D:\sistem\apache\ssl\test
openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout "%certPath%\%2.key" -subj "/C=ID/CN=%1" -out "%certPath%\%2.pem"
openssl x509 -outform pem -in "%certPath%\%2.pem" -out "%certPath%\%2.crt"
PAUSE