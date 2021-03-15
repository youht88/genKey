openssl ecparam --name SM2 -genkey -out sm2.key
openssl ec -in sm2.key -pubout -out sm2.pubkey
