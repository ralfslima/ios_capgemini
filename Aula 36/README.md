# 📌 Trabalho Prático: Consumo de API

**📅 Data de Entrega:** 30/11/2026  

---

## 🎯 Objetivo
Desenvolver uma aplicação capaz de integrar-se a um serviço externo via **API REST**, realizar a leitura e exibição de informações e gerenciar dados localmente por meio de uma estrutura em memória ou camada de persistência.

---

## 📋 Requisitos Funcionais

### 1. Consumo de API e Listagem (Obrigatório)
* A aplicação deve consumir **pelo menos um endpoint** de uma API REST (método `GET`).
* O aluno tem liberdade para escolher entre:
  * **Utilizar uma API pública** (ex.: PokéAPI, ViaCEP, JSONPlaceholder, Rick and Morty API, OpenWeather, etc.); **OU**
  * **Criar a sua própria API** (utilizando Node.js, Python/FastAPI, Java/Spring, C#, PHP, JSON Server, etc.).
* Os dados retornados pela requisição devem ser tratados e exibidos em uma **listagem** organizada na interface ou terminal da aplicação.

### 2. Cadastramento e Remoção de Dados (Obrigatório)
A partir dos dados obtidos da API (ou em conjunto com eles), a aplicação deve permitir o gerenciamento local das informações, contemplando:
* **Cadastro (Inserção):** Permitir ao usuário adicionar/salvar novos itens ou favoritar itens vindos da API.
* **Remoção (Exclusão):** Permitir ao usuário remover itens previamente cadastrados/salvos.
* **Camada de Armazenamento:** Os dados manipulados devem ser mantidos utilizando:
  * Uma **lista/array em memória** durante a execução do programa; **OU**
  * Uma **camada de persistência** (ex.: `LocalStorage`, arquivo JSON/CSV, SQLite, banco de dados relacional ou NoSQL).

---

## 🛠️ Requisitos Técnicos
* O código deve estar organizado, legível e devidamente indentado.
* Tratamento básico de erros para falhas na requisição HTTP (ex.: exibição de mensagem amigável caso a API esteja indisponível ou retorne erro).
* O projeto pode ser desenvolvido em qualquer linguagem ou stack definida na disciplina (Web, Mobile, Desktop ou Console).

---

## 📦 Forma de Entrega

---

## 📊 Critérios de Avaliação

| Critério | Descrição | Peso |
| :--- | :--- | :---: |
| **Consumo da API** | Requisição funcionando corretamente e tratamento adequado do retorno (JSON). | 30% |
| **Listagem de Dados** | Exibição clara e estruturada dos dados obtidos da API. | 20% |
| **Cadastro e Remoção** | Funcionamento correto das operações de inserção e exclusão na lista/persistência. | 30% |
| **Organização e Documentação** | Clareza do código, boas práticas e instruções no `README.md`. | 20% |
