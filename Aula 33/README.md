# Projeto de Acompanhamento: Gerenciador de Eventos
**Programa de Formação iOS — Capgemini & Ready Proway**

---

## 🎯 Objetivo
Desenvolver um aplicativo iOS nativo utilizando **SwiftUI** para o gerenciamento de eventos pessoais ou corporativos. O projeto tem como foco consolidar os conhecimentos em persistência de dados local com **SwiftData** e organização de código seguindo o padrão arquitetural **MVVM (Model-View-ViewModel)**.

---

## 📋 Requisitos Funcionais
O aplicativo deve permitir que o usuário realize as seguintes operações:

* **Cadastrar Evento (Create):** Um formulário para inserir um novo evento contendo os seguintes campos obrigatórios:
  * **Título** (`String`)
  * **Descrição** (`String`)
  * **Data e Hora do Evento** (`Date`)
  * **Local** (`String`)
* **Listar Eventos (Read):** Exibir todos os eventos cadastrados em uma lista organizada e legível.
* **Remover Evento (Delete):** Permitir a exclusão de eventos da lista (ex: deslizando o item da lista com `.onDelete`).

---

## 🛠️ Requisitos Técnicos
Para a aprovação da entrega, o código deve seguir obrigatoriamente a seguinte estrutura:

1. **Persistência com SwiftData:**
   * Criar a classe de modelo `Evento` utilizando a macro `@Model`.
   * Configurar o `.modelContainer(for: Evento.self)` na raiz do aplicativo (`@main`).
2. **Arquitetura MVVM:**
   * Separar a aplicação em camadas claras: **Model**, **View** e **ViewModel**.
   * Utilizar a macro `@Observable` na `EventoViewModel` para gerenciar o estado da tela e as operações no `ModelContext` (`insert`, `fetch` e `delete`).
   * Manter a `View` focada apenas na interface gráfica e na chamada dos métodos da `ViewModel`.
3. **Validação Básica:**
   * Impedir o cadastro de eventos caso campos essenciais (como título ou local) estejam vazios.

---

## 🌟 Diferenciais (Opcional)
Caso queira ir além do escopo básico, você pode implementar:
* **Ordenação:** Listar os eventos em ordem cronológica (do mais próximo para o mais distante) utilizando `SortDescriptor`.
* **Busca/Filtro:** Adicionar uma barra de pesquisa (`.searchable`) para filtrar eventos por título ou local.
* **Edição (Update):** Permitir que o usuário toque em um evento existente para atualizar suas informações.

---

## 📅 Prazo e Forma de Entrega
* **Data Limite:** **30/11 às 10h00**
