## Fake certificate (self-signed)

> (!) Certificates and private keys in this directory are generated for testing purposes only.

**CA:**
```bash
openssl genrsa 2048 > ca.key &&
openssl req -new -x509 -nodes -days 365000 -key ca.key -out ca.crt # set the CN to 127.0.0.1
```

**CSR and Private Key:**
```bash
openssl req -new -newkey rsa:2048 -nodes -out example.csr -keyout example.key -subj "/C=US/ST=State/L=City/O=Example/OU=IT/CN=*.example.com"
```

**Public Key:**
```bash
openssl x509 -signkey example.key -in example.csr -req -days 3650 -out example.crt
```

**Base64 Encoded Private Key:**
```bash
base64 -i example.key -o example_key_base64.txt
```

**Base64 Encoded Public Key:**
```bash
base64 -i example.crt -o example_crt_base64.txt
```
