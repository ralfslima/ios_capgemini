# 📚 Enunciado do Projeto: Sistema de Gerenciamento de Biblioteca (CLI)

## 🎯 Objetivo
Criar uma ferramenta de linha de comando (**Command Line Tool**) em **Swift** utilizando o Xcode. O objetivo principal é consolidar os conceitos de **Programação Orientada a Objetos (POO)**, manipulação de coleções, lógica de fluxos de controle e interação com o usuário via Console (`Terminal`).

---

## 🛠️ Requisitos Funcionais (O CRUD)
O sistema deve gerenciar uma coleção de **Livros** e permitir as seguintes operações:

* **Create (Cadastrar):** Adicionar um novo livro ao sistema, garantindo que não existam IDs duplicados.
* **Read (Listar/Buscar):** 
  * Listar todos os livros cadastrados com formatação limpa e legível.
  * Buscar um livro específico por seu identificador único (ID) ou por trechos do título.
* **Update (Editar):** Atualizar as informações de um livro existente (como alterar o título, autor ou o status de empréstimo).
* **Delete (Remover):** Excluir um livro do sistema através do seu ID.

---

## 🧱 Requisitos Técnicos e Arquitetura (Foco em POO)
Para garantir uma boa estrutura de software, você deve aplicar os seguintes pilares da orientação a objetos:

### 1. Modelagem de Dados (`Protocols`, `Classes` e `Structs`)
* **Protocolo `Documento`:** Defina um protocolo que exija uma propriedade `id: UUID` (ou `Int`) e um método `exibirDetalhes()`.
* **Classe `Livro`:** Deve adotar o protocolo `Documento`. Propriedades obrigatórias: `id`, `titulo`, `autor`, `anoPublicacao` e `isEmprestado` (Booleano).
* **Encapsulamento:** As propriedades não devem ser alteradas diretamente de fora da classe. Use métodos modificadores (ex: `emprestar()` e `devolver()`) para gerenciar o status do livro.

### 2.  Interface de Usuário (`Console`)
* O programa deve rodar em um laço de repetição contínuo (`while`) exibindo um menu de opções numéricas no console.
* Use `readLine()` para capturar as entradas do usuário, tratando valores opcionais (`nil`) com segurança e realizando a conversão correta de tipos (ex: converter String para Int).

---

## 🚦 Atenção!
Disponibilizar o projeto no repositório do GitHub (aquele mesmo que foi enviado para o e-mail: contato@ralflima.com).
Data limite para enviar o projeto para o repositório: 19/10 (segunda-feira) às 10h.

---

## 🚀 Desafio Extra (Opcional)
Implemente o conceito de **Herança**: crie uma classe derivada chamada `LivroDigital` que herda de `Livro`. Ela deve adicionar a propriedade `tamanhoEmMB` e sobrescrever (`override`) o método `exibirDetalhes()` para exibir essa informação adicional no console.
