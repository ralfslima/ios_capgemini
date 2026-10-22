# Projeto Final SwiftUI — Controle de Notas dos Alunos

## 🎯 Objetivo

Desenvolver um aplicativo utilizando **SwiftUI** para cadastrar alunos, registrar suas notas e acompanhar seus resultados acadêmicos.

O projeto tem como objetivo avaliar os conhecimentos adquiridos durante o módulo, incluindo organização de layouts, utilização de componentes visuais, entrada de dados, listas dinâmicas e manipulação de estado.

## 📋 Descrição do projeto

Você deverá desenvolver um aplicativo de controle de notas que permita cadastrar alunos, visualizar suas notas, calcular suas médias e identificar se foram aprovados ou reprovados.

O aplicativo deverá possuir **uma única tela**, com formulário de cadastro e listagem dos alunos cadastrados.

## 1. Cadastro de alunos

O aplicativo deverá permitir o cadastro de alunos por meio de um formulário contendo os seguintes campos:

- **Nome:** campo de texto para informar o nome do aluno.
- **Nota 1:** campo numérico para informar a primeira nota.
- **Nota 2:** campo numérico para informar a segunda nota.
- **Botão Cadastrar:** responsável por adicionar o aluno à listagem.

### Regras de cadastro

- O nome do aluno não poderá estar vazio.
- As notas deverão estar entre 0 e 10.
- Os campos deverão ser validados antes de cadastrar o aluno.
- Após um cadastro realizado com sucesso, os campos deverão ser limpos automaticamente.

## 2. Listagem dos alunos

Os alunos cadastrados deverão ser apresentados na própria tela do aplicativo.

Para cada aluno, deverão ser exibidas as seguintes informações:

- Nome do aluno.
- Nota 1.
- Nota 2.
- Média final.
- Situação acadêmica.
- Botão para remover o aluno.

A listagem deverá ser atualizada automaticamente sempre que um aluno for cadastrado ou removido.

## 3. Cálculo da média

A média final deverá ser calculada automaticamente a partir das duas notas informadas.

**Fórmula:**

Média = (Nota 1 + Nota 2) / 2

A média deverá ser apresentada com uma casa decimal.

### Situação acadêmica

A situação do aluno deverá ser determinada de acordo com sua média:

- **Aprovado:** média maior ou igual a 7,0.
- **Reprovado:** média menor que 7,0.

A situação deverá ser atualizada automaticamente conforme os dados cadastrados.

## 4. Remoção de alunos

Cada aluno da listagem deverá possuir um botão para removê-lo.

Ao acionar esse botão, o aluno correspondente deverá ser excluído da lista, sem afetar os demais registros.

Após a remoção, a interface deverá ser atualizada automaticamente.

## 5. Resumo da turma

O aplicativo deverá apresentar um resumo contendo:

- Quantidade total de alunos cadastrados.
- Quantidade de alunos aprovados.
- Quantidade de alunos reprovados.

Esses valores deverão ser calculados automaticamente com base nos alunos presentes na listagem.

## 6. Requisitos técnicos

O desenvolvimento deverá respeitar as seguintes regras:

- Utilizar SwiftUI e Xcode 26/27.
- Utilizar apenas uma tela principal.
- Não utilizar arquitetura MVVM.
- Não utilizar APIs ou serviços externos.
- Não utilizar persistência de dados, banco de dados ou armazenamento local.
- Manter os alunos cadastrados apenas em memória durante a execução do aplicativo.
- Utilizar `@State` para gerenciar os estados necessários.
- Utilizar componentes nativos do SwiftUI.
- Organizar a interface de forma clara, consistente e responsiva.

**Importante:** os dados cadastrados não precisam ser mantidos após o encerramento do aplicativo.

## 7. Exemplo
![Imagem da Aula 18](https://raw.githubusercontent.com/ralfslima/ios_capgemini/main/Aula%2018/imagem.png)

## 9. Entrega

Disponibilizar no repositório do GitHub até dia 03/11 (terça-feira) às 10h.

**Bom desenvolvimento!**
