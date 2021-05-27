#!/bin/bash
#title          :quick-certificates-jdk.sh
#description    :Script to facilitate the import of various certificates for JDK cacerts.
#author		    :davydmaker
#date           :20210527
#version        :1.1    
#usage		    :bash mkscript.sh
#notes          :Indicate the JDK directory and the directory with the certificates to install (using "/").
#==============================================================================

pathJava="C:/Program Files/Java/jdk-11.0.9"
pathCertificate-"C:/certificates"

javaVersion=$("$pathJava/bin/java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
pass="changeit"

if [ $javaVersion > "8" ]; then cacerts="-cacerts"; else cacerts="-keystore $pathJva/lib/security/cacerts"; fi

for fileCrt in "$pathCertificates"/*.{crt,cer}
do
    fileCrtName=$(basename $fileCrt)
    if [ $fileCrtName != "*.crt" ] && [ $fileCrtName != "*.cer" ]
    then
        fileCrtName=${fileCrtName%.*}
        eval "$pathJava/bin/keytool.exe -delete -noprompt -trustcacerts -alias $fileCrtName $cacerts -storepass $pass"
        eval "$pathJava/bin/keytool.exe $cacerts -J-Duser.language=en -importcert -alias $fileCrtName -file $fileCrt -storepass $pass -trustcacerts -noprompt"
    fi
done