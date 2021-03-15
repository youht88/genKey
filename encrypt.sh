#随机生成8字节对称密码，使用sm4算法加密源文
pass=$(openssl rand -hex 8);
openssl enc -e -SM4 -pbkdf2 -a -in $1 -out temp -pass pass:$pass
cid=$(icfs add -Q temp)
#echo $cid
#非对称加密cid和pass，0表示采用sm4对称密钥加密
newString=$cid:0:$pass
echo -n $newString | openssl rsautl -encrypt -pubin -inkey rsa.pubkey -out $1.cid 
#签名
openssl dgst -sha256 -sign sm2.key -out $1.cid.sig $1.cid

