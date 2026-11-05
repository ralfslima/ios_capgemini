# Exercício Prático: Desenvolvimento de um To-Do List com SwiftUI e MVVM

**Data de Entrega:** 18/11 às 10 horas, via repositório no GitHub.

---

### 🎯 Objetivo
Neste exercício, você vai aplicar o padrão de arquitetura **MVVM (Model-View-ViewModel)** para construir um aplicativo de lista de tarefas (**To-Do List**) interativo utilizando **SwiftUI**. O foco principal é garantir a separação clara de responsabilidades entre a interface gráfica e a lógica de negócios.

---

### 🏗️ Arquitetura Esperada (MVVM)

Seu projeto deve ser estritamente dividido em três camadas principais:

* **Model**: Define a estrutura dos dados. Deve ser uma estrutura simples (`struct`) que represente uma tarefa, contendo propriedades como identificador único, título e status de conclusão.
* **ViewModel**: Classe responsável por gerenciar o estado da tela, expor os dados para a View e conter a lógica de negócios (adicionar, remover e alternar o status das tarefas). Ela deve adotar as ferramentas de gerenciamento de estado modernas do SwiftUI.
* **View**: Camada de interface de usuário estruturada inteiramente em SwiftUI. Ela deve apenas observar e reagir às mudanças da ViewModel, além de disparar ações do usuário para ela.

---

### 📋 Requisitos do Aplicativo

Sua aplicação deve conter, no mínimo, as seguintes funcionalidades e componentes visuais:

* **Lista de Tarefas**: Uma tela principal que exibe todas as tarefas cadastradas.
* **Criação de Tarefas**: Um campo de texto ou modal que permita ao usuário digitar e adicionar uma nova tarefa à lista.
* **Alternar Status**: Um mecanismo visual (como um botão de check ou um toque na célula) que mude o estado da tarefa entre "Pendente" e "Concluída".
* **Exclusão**: Funcionalidade para deletar uma tarefa da lista (utilizando o gesto de arrastar para o lado — *swipe-to-delete*).

---

### 🛠️ Critérios de Avaliação

* **Separação de Conceitos (MVVM)**: A View não deve conter lógica de adição, remoção ou manipulação direta do array de dados.
* **Gerenciamento de Estado**: Uso correto de propriedades de estado do SwiftUI para comunicação entre a View e a ViewModel.
* **Organização do Código**: Código limpo, bem indentado e dividido em arquivos/pastas separados por camada (`Models`, `ViewModels`, `Views`).

---

### 🚀 Instruções de Entrega

Desenvolva o projeto garantindo que o commit final seja feito até as **10:00 do dia 18/11**.
