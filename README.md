# quick-certificates-jdk
##### Script to facilitate the import of various certificates for JDK cacerts.
[![Shell Script](https://img.shields.io/badge/shell-script-blue)]()

Ao executar o script ele vai importar no cacerts da JDK informada os certificados do diretório informado, utlizando o nome do arquivo como alias dele e sempre utilizando a senha `changeit` (caso quiser alterar só mudar variável no script).

---

## Configurações
Faça o apontamento do diretório da JDK alterando a variável `pathJava`. Exemplo:
```sh
pathJava="C:\Program Files\Java\jdk-11.0.9"
```

Faça o apontamento do diretório que contém a lista de certificados alterando a variável `pathCertificate` para importar para o cacerts da JDK informada. Exemplo:
```sh
pathCertificate="C:\certificates"
```