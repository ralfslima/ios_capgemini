# 📦 Manipulação de Arrays em Swift

Arrays são coleções ordenadas que armazenam elementos do mesmo tipo. Em Swift, a manipulação de arrays é altamente performática e conta com suporte nativo a conceitos de Programação Funcional (como `map`, `filter` e `reduce`).

Abaixo estão os 10 principais comandos e funções para gerenciar e transformar arrays.

---

### 1. Criar e Inicializar Arrays
* **Descrição:** Cria arrays vazios ou preenchidos com valores padrão informando o tipo de dado entre colchetes `[Tipo]`.
* **Exemplo:**
  ```swift
  var compras: [String] = [] // Array vazio de Strings
  var numeros = [1, 2, 3]    // Swift infere o tipo como [Int]
  var notasRepetidas = Array(repeating: 10.0, count: 3) // [10.0, 10.0, 10.0]
  ```

### 2. Adicionar Elementos (Append e Insert)
* **Descrição:** Insere novos itens ao final da lista usando `.append()` ou em uma posição específica usando `.insert(at:)`.
* **Exemplo:**
  ```swift
  var frutas = ["Maçã", "Banana"]
  frutas.append("Uva") // ["Maçã", "Banana", "Uva"]
  frutas.insert("Morango", at: 0) // ["Morango", "Maçã", "Banana", "Uva"]
  ```

### 3. Acessar Elementos por Índice e Propriedades
* **Descrição:** Acessa um elemento diretamente pelo seu índice numérico (começando em `0`) ou obtém limites seguros com as propriedades `.first` e `.last`.
* **Exemplo:**
  ```swift
  let tecnologias = ["iOS", "macOS", "watchOS"]
  let primeira = tecnologias[0]   // "iOS"
  let ultimaSegura = tecnologias.last // Retorna um Opcional: Optional("watchOS")
  ```

### 4. Remover Elementos
* **Descrição:** Remove elementos por índice, remove o primeiro/último ou limpa a coleção inteira.
* **Exemplo:**
  ```swift
  var tarefas = ["Estudar", "Treinar", "Dormir", "Lavar Louça"]
  tarefas.remove(at: 1) // Remove "Treinar"
  tarefas.removeLast()  // Remove "Lavar Louça"
  tarefas.removeAll()   // Limpa o array inteiro: []
  ```

### 5. Verificar Tamanho e Existência de Itens
* **Descrição:** Propriedades para contar elementos (`.count`), checar se está vazio (`.isEmpty`) ou buscar se um valor existe lá dentro (`.contains`).
* **Exemplo:**
  ```swift
  let alunos = ["Ana", "Carlos", "Beatriz"]
  print(alunos.count) // 3
  if !alunos.isEmpty {
      let temCarlos = alunos.contains("Carlos") // true
  }
  ```

### 6. Ordenar um Array (Sort e Sorted)
* **Descrição:** Organiza os elementos em ordem crescente/decrescente. `.sort()` modifica o array original, enquanto `.sorted()` devolve uma cópia ordenada.
* **Exemplo:**
  ```swift
  var idades = [25, 18, 40, 31]
  let idadesOrdenadas = idades.sorted() // [18, 25, 31, 40]
  idades.sort(by: >) // Modifica o original para decrescente: [40, 31, 25, 18]
  ```

### 7. Transformar Elementos (Map)
* **Descrição:** Aplica uma transformação em cada elemento do array e gera um novo array com os resultados modificados.
* **Exemplo:**
  ```swift
  let precos = [10.0, 20.0, 50.0]
  let precosComDesconto = precos.map { $0 * 0.9 } 
  // Resultado: [9.0, 18.0, 45.0]
  ```

### 8. Filtrar Elementos (Filter)
* **Descrição:** Filtra a coleção mantendo apenas os elementos que atendem a uma condição lógica específica.
* **Exemplo:**
  ```swift
  let notas = [8.5, 4.0, 7.0, 5.5, 9.0]
  let aprovados = notas.filter { $0 >= 7.0 }
  // Resultado: [8.5, 7.0, 9.0]
  ```

### 9. Reduzir a um Único Valor (Reduce)
* **Descrição:** Combina todos os elementos do array em um único valor final através de uma operação matemática ou lógica.
* **Exemplo:**
  ```swift
  let despesas = [15, 30, 45]
  let totalDespesas = despesas.reduce(0, +) 
  // Começa em 0 e soma tudo. Resultado: 90
  ```

### 10. Iterar com Índice e Valor (Enumerated)
* **Descrição:** Percorre o array usando um loop `for-in` obtendo tanto a posição física (índice) quanto o valor correspondente simultaneamente.
* **Exemplo:**
  ```swift
  let podio = ["Ouro", "Prata", "Bronze"]
  for (index, medalha) in podio.enumerated() {
      print("Lugar \(index + 1): \(medalha)")
  }
  // Saída: 
  // Lugar 1: Ouro
  // Lugar 2: Prata
  // Lugar 3: Bronze
  ```
