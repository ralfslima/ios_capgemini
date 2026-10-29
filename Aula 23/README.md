
# Atividade Prática: Aplicativo de Agência de Viagens com SwiftUI

## 1. Objetivo

Desenvolver um aplicativo mobile utilizando SwiftUI para simular uma agência de viagens. O aplicativo deverá permitir que o usuário explore pacotes turísticos, visualize os detalhes de cada viagem e gerencie uma lista de pacotes favoritos.

O objetivo da atividade é praticar a construção de interfaces declarativas, a modelagem de dados, o gerenciamento de estado e a navegação entre telas em aplicações iOS.

## 2. Descrição da atividade

Você deverá desenvolver um aplicativo de agência de viagens que apresente uma lista de pacotes turísticos nacionais e internacionais.

Cada pacote deverá conter as seguintes informações:

- Título do pacote;
- Destino da viagem;
- Quantidade de diárias;
- Data de partida;
- Data de retorno;
- Informações sobre a hospedagem;
- Imagem representativa do destino;
- Preço do pacote.

O aplicativo deverá possuir três telas principais: tela inicial, tela de detalhes e tela de favoritos.

## 3. Tela inicial — Explorar Viagens

A tela inicial deverá apresentar uma lista de pacotes turísticos disponíveis.

Cada item da lista deverá exibir:

- Imagem do destino;
- Título do pacote;
- Localização;
- Quantidade de diárias;
- Preço em reais;
- Botão para adicionar ou remover o pacote dos favoritos.

Ao selecionar um pacote, o usuário deverá ser direcionado para a tela de detalhes correspondente.

Na barra superior, deverá existir um botão para acessar a tela de favoritos, acompanhado de um contador que indique a quantidade de pacotes favoritados.

## 4. Tela de detalhes do pacote

A tela de detalhes deverá apresentar todas as informações referentes ao pacote selecionado, incluindo:

- Imagem de destaque do destino;
- Título do pacote;
- Localização;
- Data de partida;
- Duração da viagem;
- Data de retorno;
- Informações sobre a hospedagem;
- Botão para favoritar ou desfavoritar o pacote;
- Botão de reserva com o preço do pacote.

O botão de reserva deverá ser apenas ilustrativo, não sendo necessário implementar um sistema real de pagamento.

As informações apresentadas deverão corresponder ao pacote selecionado na tela inicial.

## 5. Tela de favoritos — Meus Favoritos

A tela de favoritos deverá exibir somente os pacotes marcados como favoritos pelo usuário.

## 6. Modelagem dos dados

Sugestão: Crie uma estrutura chamada `PacoteViagem` para representar os pacotes turísticos.

A estrutura deverá conter as seguintes propriedades:

| Propriedade | Tipo | Descrição |
|---|---|---|
| `id` | `UUID` | Identificador único do pacote |
| `titulo` | `String` | Nome do pacote |
| `diarias` | `Int` | Quantidade de diárias |
| `local` | `String` | Destino da viagem |
| `dataPartida` | `String` | Data de partida |
| `dataChegada` | `String` | Data de retorno |
| `informacoesHotel` | `String` | Informações sobre a hospedagem |
| `imagemNome` | `String` | Nome da imagem utilizada |
| `preco` | `Double` | Preço do pacote |

A estrutura deverá permitir a identificação dos pacotes nas listas e sua utilização durante a navegação entre as telas.

## 7. Requisitos visuais

O aplicativo deverá apresentar uma interface organizada, intuitiva e consistente.

Considere os seguintes aspectos:

- Imagens com dimensões adequadas e cantos arredondados;
- Hierarquia visual entre títulos, subtítulos e informações complementares;
- Preços formatados em reais, com duas casas decimais;
- Diferenciação visual entre pacotes favoritados e não favoritados;
- Espaçamento adequado entre os elementos;
- Uso consistente de cores, ícones e tipografia;
- Títulos de navegação apropriados para cada tela;
- Mensagens informativas quando não houver conteúdo.

As imagens utilizadas deverão estar disponíveis nos recursos do projeto (`Assets.xcassets`) ou ser substituídas por imagens e símbolos adequados.

## 8. Entrega

Ao finalizar a atividade, envie para o repositório das demais atividades de acompanhamento.

Data limite de entrega: 09/11 (segunda-feira) às 10h.
