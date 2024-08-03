# Crud em Delphi XE7

Este projeto foi desenvolvido apenas com intuito de exemplificar o uso das funcionalidades de Consultar, Inserir, Editar e Excluir dados do banco de dados utilizando Delphi XE7 e Firebird 2.5

## 🚀 Começando

Para obter uma cópia do projeto em sua máquina local, basta clonar este repositório público em sua máquina local ou mesmo fazer o download do ZIP deste.


### 📋 Pré-requisitos

Para que seja compilado e funcione corretamente em sua máquina local, você precisará se atenar aos pré-equsitos.
Será necessário ter instalado:

```
Delphi XE7 ou Superior.
Firebird 2.5
```

### 🔧 Instalação

Ao clonar o repositório, acesse o diretório "..\Crud_Cadastro\exe\db" e abra o arquivo "DBConnection.ini" onde dentro da tag "SISTEMA" deverá ser configurado o diretório completo onde o banco de dados está localizado.
Considerando que o banco da dados está localizado no diretório "db" que encontra-se dentro do mesmo diretório onde será compilado o arquivo exe, acesse este diretório, copie o caminho e adicione ao final "Database.fdb".

Exeplo: "C:\Crud_Cadastro\exe\db\Database.fdb".

Em seguida, abra o arquivo "..\Crud_Cadastro\dpr\Crud_Cadastro.dproj" no delphi e compile.

A partir disto, acesse o diretório "..Crud_Cadastro\exe" e execute o "Crud_Cadastro.exe"



---
⌨️ Por [Ronilson Rodrigues] 😊