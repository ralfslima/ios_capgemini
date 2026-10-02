# 🔢 Trabalhando com Números em Swift

Swift possui um sistema de tipos numéricos forte e seguro. Os tipos mais comuns são `Int` (para números inteiros), `Double` e `Float` (para números com pontos decimais).

Abaixo estão os principais comandos, operadores e funções para manipular números em Swift.

---

### 1. Operações Aritméticas Básicas
* **Descrição:** Realiza os cálculos matemáticos padrão: soma (`+`), subtração (`-`), multiplicação (`*`), divisão (`/`) e resto da divisão (`%`).
* **Exemplo:**
  ```swift
  let soma = 10 + 5        // 15
  let subtracao = 10 - 5   // 5
  let multiplicacao = 10 * 5 // 50
  let divisao = 10 / 3     // 3 (Divisão de inteiros resulta em inteiro)
  let divisaoPrecisa = 10.0 / 3.0 // 3.3333333333333335
  let resto = 10 % 3       // 1 (Resto da divisão)
  ```

### 2. Atribuição Composta (Modificar a Própria Variável)
* **Descrição:** Operadores que realizam um cálculo e atualizam o valor da variável ao mesmo tempo (`+=`, `-=`, `*=`, `/=`).
* **Exemplo:**
  ```swift
  var pontuacao = 10
  pontuacao += 5 // Equivalente a pontuacao = pontuacao + 5. Resultado: 15
  pontuacao -= 2 // Resultado: 13
  ```

### 3. Comparação de Valores (Maior, Menor, Igual)
* **Descrição:** Compara dois números e retorna um valor booleano (`true` ou `false`).
* **Exemplo:**
  ```swift
  let a = 20
  let b = 10

  let maior = a > b       // true
  let menor = a < b       // false
  let maiorOuIgual = a >= 20 // true
  let menorOuIgual = b <= 5  // false
  let igual = a == b      // false
  let diferente = a != b  // true
  ```

### 4. Encontrar o Maior ou Menor entre Dois Números
* **Descrição:** Usa as funções globais `max()` e `min()` para descobrir rapidamente qual valor é o limite superior ou inferior.
* **Exemplo:**
  ```swift
  let precoAntigo = 45.90
  let precoNovo = 39.90

  let menorPreco = min(precoAntigo, precoNovo) // 39.90
  let maiorPreco = max(precoAntigo, precoNovo) // 45.90
  ```

### 5. Arredondamento de Números Decimais
* **Descrição:** Funções para arredondar valores do tipo `Double` ou `Float`: `round` (padrão), `ceil` (para cima) e `floor` (para baixo).
* **Exemplo:**
  ```swift
  let nota = 7.6

  let notaArredondada = nota.rounded() // 8.0 (Arredonda para o mais próximo)
  let paraCima = ceil(7.1)             // 8.0 (Sempre para cima)
  let paraBaixo = floor(7.9)           // 7.0 (Sempre para baixo)
  ```

### 6. Geração de Números Aleatórios (Random)
* **Descrição:** Gera um número aleatório dentro de um intervalo definido usando o método `.random(in:)`.
* **Exemplo:**
  ```swift
  // Gera um inteiro de 1 a 6 (como um dado)
  let dado = Int.random(in: 1...6)

  // Gera um decimal entre 0.0 e 1.0
  let porcentagemAleatoria = Double.random(in: 0.0...1.0)
  ```

### 7. Conversão de Tipos (Type Casting)
* **Descrição:** Swift não permite operações diretas entre tipos diferentes (como `Int` e `Double`). É necessário converter um dos valores explicitamente.
* **Exemplo:**
  ```swift
  let itens: Int = 5
  let precoUnitario: Double = 10.50

  // Errado: let total = itens * precoUnitario (Dará erro de compilação)
  let total = Double(itens) * precoUnitario // Correto: 52.5
  ```

### 8. Valor Absoluto (Remover o Sinal Negativo)
* **Descrição:** A função `abs()` retorna a magnitude de um número, transformando valores negativos em positivos.
* **Exemplo:**
  ```swift
  let saldoNegativo = -150
  let valorAbsoluto = abs(saldoNegativo) // 150
  ```

### 9. Potenciação e Raiz Quadrada
* **Descrição:** Utiliza as funções do sistema `pow()` para elevar um número a uma potência e `sqrt()` para calcular a raiz quadrada. É necessário que os valores sejam decimais (`Double` ou `Float`).
* **Exemplo:**
  ```swift
  import Foundation // Necessário para pow e sqrt

  let base = 3.0
  let expoente = 4.0
  let resultadoPotencia = pow(base, expoente) // 3 elevado a 4 = 81.0

  let raiz = sqrt(25.0) // 5.0
  ```

### 10. Formatação de Números (Moeda e Decimais Fixos)
* **Descrição:** Usa `NumberFormatter` ou as novas APIs de formatação do Swift para exibir números de forma amigável ao usuário.
* **Exemplo:**
  ```swift
  let pi = 3.14159265
  let pi Formatado = pi.formatted(.number.precision(.fractionLength(2))) 
  // Resultado: "3.14" (como String)
  ```
