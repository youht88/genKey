openssl dgst -sha256 -verify sm2.pubkey -signature $1.cid.sig $1.cid
newString=$(openssl rsautl -decrypt -inkey rsa.key -in $1.cid)
echo $newString
cid=$(echo $newString|cut -d ":" -f 1)
pass=$(echo $newString|cut -d ":" -f 3)
echo $cid
echo $pass
icfs get $cid
openssl enc -d -SM4 -pbkdf2 -a -in $cid  -out $1.bak -pass pass:$pass
rm $cid

