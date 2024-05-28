# PostsOpenCo

# Arquitetura 🚀

Esse projeto trabalha com o conceito de arquitetura utilizando os conceitos BLoC, separando o projeto em três camadas principais:

- data
- - Respository
- - Datasource
- Business Logic
- presentation

![image](https://github.com/Ramos2L/test_open_co/assets/58201578/ffa7d0cd-6848-4f21-8dc0-fda7f286c1d4)

## Presentation
É a camada de interação com o usuário onde o usuário consegue ver na tela os itens e interagir.

## Data

A responsabilidade da camada de dados é recuperar/manipular dados de uma ou mais fontes.
A camada de dados pode ser dividida em duas partes:
- Repositório
- Datasource
Esta camada é o nível mais baixo da aplicação e interage com bancos de dados, solicitações de rede e outras fontes de dados assíncronas.

## BLoC

A responsabilidade da camada lógica de negócios é responder às entradas da camada de apresentação com novos estados. Esta camada pode depender de um ou mais repositórios para recuperar os dados necessários para construir o estado do aplicativo.

### O que esta incluso no projeto? 📦


✅&nbsp; [BLoC][bloc_link]

✅&nbsp; [Equatable][equatable_link] 

✅&nbsp; [Modular][modular_link]

✅&nbsp; [Dio][dio_link]

✅&nbsp; [Flutter SVG][flutter_svg_link]

✅&nbsp; [Flutter Native Splash][flutter_native_splash_link]


[modular_link]: https://pub.dev/packages/flutter_modular
[bloc_link]: https://bloclibrary.dev
[equatable_link]: https://pub.dev/packages/equatable
[dio_link]: https://pub.dev/packages/dio
[flutter_native_splash_link]: https://pub.dev/packages/flutter_native_splash
[flutter_svg_link]: https://pub.dev/packages/flutter_svg

# API  {JSON} Placeholder
A API do <a href="https://jsonplaceholder.typicode.com"> {JSON} Placeholder</a>  oferece acesso a informações fakes para testar em protótipos.
 
# Telas implementadas

O app pode ser baixado aqui:

Made with :heart: and Flutter 3.13.9 e Dart 3.1.5
