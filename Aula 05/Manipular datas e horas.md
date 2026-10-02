# 📅 Trabalhando com Datas e Horários em Swift

Gerenciar datas em Swift exige o uso da estrutura `Date` junto com componentes de calendário e formatadores fornecidos pelo framework **Foundation**. Como o tempo envolve fusos horários e calendários diferentes, a linguagem oferece ferramentas robustas para lidar com essa complexidade de forma segura.

Abaixo estão os principais comandos e conceitos para manipular datas em Swift.

---

### 1. Obter a Data e Hora Atual
* **Descrição:** Cria uma instância com a data e o horário exatos do momento da execução.
* **Exemplo:**
  ```swift
  import Foundation

  let agora = Date()
  print(agora) // Exibe a data/hora universal (UTC)
  ```

### 2. Formatar Data para String (Estilos Prontos)
* **Descrição:** Transforma um objeto `Date` em texto legível utilizando os estilos predefinidos modernos do Swift (`.formatted`).
* **Exemplo:**
  ```swift
  let hoje = Date()

  // Apenas a data por extenso
  let dataExtenso = hoje.formatted(date: .long, time: .omitted) // Ex: "2 de outubro de 2026"

  // Data e hora resumidas
  let dataHoraCurta = hoje.formatted(date: .numeric, time: .shortened) // Ex: "02/10/2026 16:15"
  ```

### 3. Formatação Personalizada (Custom DateFormatter)
* **Descrição:** Permite definir um padrão de texto exato usando caracteres de formatação (como `dd`, `MM`, `yyyy`).
* **Exemplo:**
  ```swift
  let formatter = DateFormatter()
  formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"

  let dataFormatada = formatter.string(from: Date()) // Ex: "02/10/2026 16:15:30"
  ```

### 4. Converter String em Data (Parse)
* **Descrição:** Transforma um texto que representa uma data de volta em um objeto `Date`. Como o texto pode estar inválido, o retorno é um opcional.
* **Exemplo:**
  ```swift
  let textoData = "25/12/2026"
  let formatter = DateFormatter()
  formatter.dateFormat = "dd/MM/yyyy"

  if let dataConvertida = formatter.date(from: textoData) {
      print(dataConvertida) // Objeto Date criado com sucesso
  }
  ```

### 5. Extrair Componentes Específicos (Dia, Mês, Ano)
* **Descrição:** Usa o `Calendar` do sistema para isolar partes individuais de uma data.
* **Exemplo:**
  ```swift
  let data = Date()
  let componentes = Calendar.current.dateComponents([.day, .month, .year, .weekday], from: data)

  let dia = componentes.day        // Ex: 2
  let mes = componentes.month      // Ex: 10
  let ano = componentes.year       // Ex: 2026
  let diaDaSemana = componentes.weekday // 1 = Domingo, 6 = Sexta, etc.
  ```

### 6. Criar uma Data Manualmente
* **Descrição:** Define componentes específicos (ano, mês, dia) dentro de um calendário para gerar uma data específica no tempo.
* **Exemplo:**
  ```swift
  var componentes = DateComponents()
  componentes.year = 2027
  componentes.month = 1
  componentes.day = 1
  componentes.hour = 0
  componentes.minute = 0

  if let anoNovo = Calendar.current.date(from: componentes) {
      print(anoNovo) // 01/01/2027 à meia-noite
  }
  ```

### 7. Somar ou Subtrair Tempo de uma Data
* **Descrição:** Adiciona ou remove dias, meses ou horas de uma data existente usando a função `date(byAdding:value:to:)`.
* **Exemplo:**
  ```swift
  let hoje = Date()

  // Adicionar 7 dias à data atual
  if let proximaSemana = Calendar.current.date(byAdding: .day, value: 7, to: hoje) {
      print(proximaSemana)
  }

  // Subtrair 2 meses da data atual
  if let doisMesesAtras = Calendar.current.date(byAdding: .month, value: -2, to: hoje) {
      print(doisMesesAtras)
  }
  ```

### 8. Calcular a Diferença entre Duas Datas
* **Descrição:** Retorna a quantidade de tempo (em dias, horas, minutos) decorrida entre dois pontos temporais.
* **Exemplo:**
  ```swift
  let inicio = Date()
  // Imaginando uma data futura de término criada previamente
  let fim = Calendar.current.date(byAdding: .day, value: 10, to: inicio)! 

  let diferenca = Calendar.current.dateComponents([.day], from: inicio, to: fim)
  print(diferenca.day!) // Resultado: 10
  ```

### 9. Comparar Datas (Quem veio antes ou depois)
* **Descrição:** Compara duas instâncias de data usando operadores lógicos padrão como `<`, `>` ou `==`.
* **Exemplo:**
  ```swift
  let dataDisparada = Date()
  let dataVencimento = Date().addingTimeInterval(3600) // +1 hora à frente

  if dataDisparada < dataVencimento {
      print("O prazo ainda não venceu!")
  }
  ```

### 10. Modificar Fuso Horário (Time Zone)
* **Descrição:** Altera a exibição de uma data para corresponder ao fuso horário de uma região ou cidade específica.
* **Exemplo:**
  ```swift
  let formatadorComFuso = DateFormatter()
  formatadorComFuso.dateFormat = "HH:mm"

  // Definindo fuso de Tóquio
  formatadorComFuso.timeZone = TimeZone(identifier: "Asia/Tokyo")
  print("Hora em Tóquio: \(formatadorComFuso.string(from: Date()))")
  ```
