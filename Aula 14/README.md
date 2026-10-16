# 🚀 Lista de Exercícios: Praticando SwiftUI e Structs

Esta lista de exercícios foi desenvolvida para praticar os conceitos fundamentais de desenvolvimento iOS utilizando **SwiftUI**. O foco principal é entender o gerenciamento de estados com `@State`, o uso de componentes visuais básicos (`VStack`, `HStack`, `TextField`, `Button`, `List`) e a organização de dados utilizando `structs`.

---

## 📝 1º Exercício: Calculador de Média Escolar
Crie um aplicativo que receba as informações de um estudante e exiba o resultado da sua média final junto com a sua situação acadêmica.

### Requisitos:
* Criar campos de entrada para o **Nome do Aluno**, **Nota 1** e **Nota 2**.
* Criar um botão "Calcular Média".
* Ao clicar no botão, exibir o nome do aluno, a média final formatada com uma casa decimal e a sua situação atual seguindo as regras:
  * **Aprovado:** Média igual ou superior a `7.0` (Exibir o texto em verde).
  * **Em Exame:** Média entre `5.0` e `6.9` (Exibir o texto em laranja).
  * **Reprovado:** Média abaixo de `5.0` (Exibir o texto em vermelho).

### 💡 Dica de Estrutura do Modelo:
Comece criando um arquivo chamado `Aluno.swift` com as propriedades básicas que vão receber os textos dos inputs:
```swift
struct Aluno {
    var nome: String = ""
    var nota1: String = ""
    var nota2: String = ""
    
    // Insira aqui suas propriedades calculadas (media, situacao, corSituacao)
}
```

---

## 📝 2º Exercício: Cadastro de Pessoas
Crie um sistema simples para cadastrar e gerenciar uma lista de pessoas e suas respectivas cidades natal.

### Requisitos:
* Criar campos de entrada para o **Nome** e a **Cidade**.
* Criar um botão convencional chamado "Adicionar Pessoa" que limpa os campos de texto após o cadastro.
* Exibir os registros salvos utilizando o componente `List`.
* Dentro de cada linha da lista, adicione um botão convencional do tipo "Remover" que, ao ser clicado, deleta permanentemente aquela pessoa da listagem.

### 💡 Dica de Estrutura do Modelo:
Como as pessoas serão exibidas dentro de um componente `List`, o seu modelo precisa assinar o protocolo `Identifiable` para diferenciar cada registro unicamente:
```swift
import Foundation

struct Pessoa: Identifiable {
    var id = UUID() 
    var nome: String
    var cidade: String
}
```

---

## 📝 3º Exercício: Jogo "Adivinhe o Número"
Desenvolva um jogo interativo onde o usuário tenta adivinhar um número secreto sorteado pelo próprio aplicativo.

### Requisitos:
* O sistema deve sortear um número inteiro secreto de **1 até 100** assim que o app iniciar.
* Criar um campo de texto para o usuário digitar o seu palpite e um botão "Enviar Palpite".
* Enquanto o usuário não acertar o número, o app deve exibir uma dica baseada na proximidade:
  * **Até 5 de diferença:** "Muito perto!"
  * **Entre 6 e 10 de diferença:** "Perto!"
  * **Entre 11 e 15 de diferença:** "Longe!"
  * **Acima de 15 de diferença:** "Muito longe!"
* Exibir um contador na tela mostrando a **quantidade de tentativas** realizadas.
* Quando o usuário acertar o número, oculte os campos de palpite e exiba um botão **"Jogar Novamente"** para reiniciar o jogo com um novo número secreto e zerar o contador.

### 💡 Dica de Como Gerar o Número Sorteado:
Para gerar um número aleatório em Swift dentro de um intervalo específico, utilize a função `.random(in:)` diretamente no tipo do dado:
```swift
// Exemplo de como sortear um número inteiro de 1 a 100:
let numeroSecreto = Int.random(in: 1...100)
```

---

## 📝 4º Exercício: Conversor de Moedas
Crie uma ferramenta de conversão monetária rápida com taxas fixas de mercado para praticar reaproveitamento de funções matemáticos.

### Requisitos:
* Considere as seguintes taxas fixas de conversão para o exercício:
  * **Dólar:** R\$ 5,00
  * **Euro:** R\$ 5,50
* Criar um único campo de texto para o usuário digitar o **Valor** numérico que deseja converter.
* Criar uma grade contendo 4 botões de ação correspondentes às conversões solicitadas:
  1. **Real para Dólar**
  2. **Real para Euro**
  3. **Dólar para Real**
  4. **Euro para Real**
* Ao clicar em qualquer um dos botões, exibir na tela o resultado formatado com o símbolo da moeda e duas casas decimais (Exemplo: `R$ 100.00 = $ 20.00`).
