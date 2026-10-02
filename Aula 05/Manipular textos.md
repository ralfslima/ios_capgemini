# Guia Rápido: Principais Comandos de Texto (String) em Swift

Este guia prático apresenta 10 comandos essenciais para a manipulação de strings na linguagem Swift, contendo a descrição e exemplos de uso para cada um.

---

### 1. Criar uma String Vazia
* **Descrição:** Inicializa uma variável de texto sem nenhum conteúdo.
* **Exemplo:**
  ```swift
  var textoVazio1 = ""
  var textoVazio2 = String()
  ```

### 2. Interpolação de String
* **Descrição:** Insere variáveis ou constantes diretamente dentro de uma literal de texto utilizando a sintaxe `\()`.
* **Exemplo:**
  ```swift
  let nome = "Ana"
  let saudacao = "Olá, \(nome)!" 
  // Resultado: "Olá, Ana!"
  ```

### 3. Contar Caracteres
* **Descrição:** Retorna a quantidade total de caracteres (comprimento) da string através da propriedade `.count`.
* **Exemplo:**
  ```swift
  let senha = "12345"
  print(senha.count) 
  // Resultado: 5
  ```

### 4. Verificar se está Vazia
* **Descrição:** Avalia se a string não possui caracteres, retornando um valor booleano (`true` ou `false`). É mais eficiente do que checar se `.count == 0`.
* **Exemplo:**
  ```swift
  let texto = ""
  if texto.isEmpty {
      print("A string está totalmente vazia.")
  }
  ```

### 5. Alterar Caixa do Texto (Maiúsculas/Minúsculas)
* **Descrição:** Transforma todos os caracteres alfabéticos da string para letras maiúsculas ou minúsculas.
* **Exemplo:**
  ```swift
  let original = "Swift"
  let maiuscula = original.uppercased() // "SWIFT"
  let minuscula = original.lowercased() // "swift"
  ```

### 6. Verificar Prefixo e Sufixo
* **Descrição:** Valida se o texto inicia ou termina com um conjunto específico de caracteres.
* **Exemplo:**
  ```swift
  let arquivo = "foto.png"
  let ePng = arquivo.hasSuffix(".png") // true
  let comecaComFoto = arquivo.hasPrefix("foto") // true
  ```

### 7. Substituir Pedaços de Texto
* **Descrição:** Substitui todas as ocorrências de um caractere ou termo por outra string especificada.
* **Exemplo:**
  ```swift
  let frase = "Eu gosto de Java"
  let novaFrase = frase.replacingOccurrences(of: "Java", with: "Swift")
  // Resultado: "Eu gosto de Swift"
  ```

### 8. Dividir uma String (Split)
* **Descrição:** Divide uma string em um array de substrings com base em um caractere ou critério delimitador.
* **Exemplo:**
  ```swift
  let lista = "maçã,banana,uva"
  let frutas = lista.split(separator: ",")
  // Resultado: ["maçã", "banana", "uva"]
  ```

### 9. Remover Espaços em Branco
* **Descrição:** Elimina espaços extras, tabulações e quebras de linha presentes nas extremidades (início e fim) do texto.
* **Exemplo:**
  ```swift
  let input = "  meu usuário   "
  let limpo = input.trimmingCharacters(in: .whitespacesAndNewlines)
  // Resultado: "meu usuário"
  ```

### 10. Concatenação de Strings
* **Descrição:** Une duas ou mais strings para formar uma nova, utilizando o operador aritmético de adição (`+`).
* **Exemplo:**
  ```swift
  let parte1 = "Desenvolvimento "
  let parte2 = "iOS"
  let curso = parte1 + parte2 
  // Resultado: "Desenvolvimento iOS"
  ```
