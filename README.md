## My Store

Este é um projeto de aplicativo de loja desenvolvido em Flutter. O aplicativo permite que os usuários naveguem por categorias de produtos, visualizem detalhes dos produtos e adicionem produtos à lista de desejos.

## Arquitetura

O projeto segue a arquitetura limpa (Clean Architecture) com BloC (Business Logic Component), que facilita a separação entre a lógica de negócios e a interface, permitindo um fluxo de dados reativo e previsível.

### Camadas

- **Config**: Contém classes que vão cuidar da configuração base do projeto
- **Ui**: Contém as pages e cubits que gerenciam a lógica de apresentação.
- **Domain**: Contém as entidades e use cases que representam as regras de negócio.
- **Data**: Contém as implementações dos repositórios e datasources.
- **Utils**: Classes que serão utilizadas em várias features

## Bibliotecas Externas Utilizadas

- `get_it`: Biblioteca para gerenciamento de estado e navegação.
- `dartz`: Biblioteca para manipulação de tipos funcionais, como `Either`.
- `flutter_bloc`: Biblioteca para gerenciamento de estado.
- `dio`: Biblioteca utilizada pra requests http
- `go_router`: Biblioteca para gerenciamento de rotas
- `shared_preferences`: Biblioteca para armazenamento local

## 🚀 Como rodar o Projeto
Siga os passos abaixo para configurar e executar o projeto localmente.

### 📋 Pré-requisitos

- [Flutter](https://flutter.dev/docs/get-started/install) (versão mínima recomendada: 3.27.0)  
- [Dart](https://dart.dev/get-dart)  
- Android Studio/Xcode (para emuladores e builds nativos)  
- Um dispositivo físico ou emulador configurado 

1. Clone o repositório:  
   ```sh
   git clone https://github.com/ymcdeveloper/my_products.git && cd my_products
2. 
                    ```sh
                    flutter pub get 
3. 
```
flutter run
