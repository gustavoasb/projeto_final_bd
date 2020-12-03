# Projeto Final de Banco de Dados
Turma B - Maristela Holanda

Tendo em vista a situação atual do Brasil, devido à crise originada pelo COVID-19, existe uma necessidade de tornar mais eficientes os atendimentos em hospitais, evitando longas filas e, consequentemente, aglomeração. Sendo assim, projeto final escolhido da disciplina de Banco de Dados consiste em um sistema para auxiliar o serviço de atendimento presencial nas emergências de hospitais particulares, por meio do gerenciamento das filas de pacientes.

Para evitar aglomerações nas emergências de hospitais, após o primeiro atendimento, os pacientes podem visualizar a sua posição na fila para a consulta com o médico de forma remota, não havendo mais a necessidade de permanecer no local de espera dos hospitais. Por meio desse mecanismo, os pacientes são notificados quando eles forem os próximos a serem atendidos.

### Alunos

- Gustavo Antonio Souza de Barros - 18/0064487
- Mayara Chew Marinho - 18/0025210

### Tecnologias Utilizadas

* [React] - Onde foi desenvolvido o front-end
* [Ruby on Rails] - Framework para criar/gerenciar bancos de dados, back-end
* [Postgres] - SGBD onde foi criado o banco
* [MaterialUI] - UI para o front-end
* [Git] - Para o controle de versionamento, inclusive você está vendo isso no GitHub agora :)
* [pgAdmin] - Ferramenta que auxilia no gerenciamento de databases do Postgres
* [ERDplus] - Utilizado para moldar o diagrama de Entidade Relacionamento
* [MySqlWorkbench] - Utilizado para moldar o Modelo Relacional
* [Insomnia] - Para realizar testes no banco mesmo sem o front-end completo

### Detalhes do Projeto


#### Modelo Entidade Relacionamento

![Modelo ER](https://i.imgur.com/9qvXqJ1.png)

#### Modelo Relacional

![Modelo Relacional](https://i.imgur.com/rpNxmiD.png)

#### Configurando o banco no rails

Para gerar o schema dentro do rails utilize o seguinte comando
```sh
rails db:schema:dump
```
é importante ficar atento que o nome da database tem que ser **trab_final_bd**. Para alterar mude a configuração no arquivo *database.yml* no back-end.

#### Configurando email para notificações

Crie um arquivo .env dentro da pasta raiz do back. Nele, coloque o seguinte trecho de código, substituindo o que for necessário:

```sh
SMTP_USER_NAME=<seu_email@gmail.com>
SMTP_PASSWORD=<senha_do_email>
```

#### Testando o banco sem utilizar o front

A fim de testar a manipulação dos dados do banco, abra o back na porta 3000 (padrão do Rails) e utilize o [Insomnia] para fazer as requisições. Um arquivo com todas as requisições do Insomnia está presente no projeto.


[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [React]: <https://pt-br.reactjs.org/>
   [Ruby on Rails]: <https://rubyonrails.org/>
   [Postgres]: <https://www.postgresql.org/>
   [MaterialUI]: <https://material-ui.com/>
   [Git]: <https://git-scm.com/>
   [pgAdmin]: <https://www.pgadmin.org/>
   [ERDplus]: <https://erdplus.com/>
   [MySqlWorkbench]: <https://www.mysql.com/products/workbench/>
   [Insomnia]: <https://insomnia.rest/>

