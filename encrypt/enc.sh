#!/bin/sh

echo "Encrypt and Decrypt personal files using openssl"

echo "Please enter encrypt/decrypt if you wanted to go ahead"

echo "I am expecting the clear password file as abcd.txt extention .txt and encrypted file .enc"
echo "I will delete plaintext file after encryption"

read -p "Enter Your input: " inputp

if [ "$inputp" == "encrypt" ]; then
     echo "I am going to encrypt"
     read -p "Enter your input filename: " filen
     filee=${filen%???}enc
     echo "Going to encrypt file $filen to $filen.enc"
     openssl enc -aes-256-cbc -in $filen -out $filee
     /bin/rm -f $filen

elif [ "$inputp" == "decrypt" ]; then
     echo "I am going to decrypt"
     read -p "Enter your input filename:" filee
     filec=${filee%???}txt
     echo "Going to decrypt to file $filec"
     openssl enc -d -aes-256-cbc -in $filee -out $filec

else
     echo "I am sorry I can understand encrypt/decrypt only"

fi

