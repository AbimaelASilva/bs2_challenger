# 🚌 Bus2 Challenger

Este projeto é uma solução para o desafio técnico de desenvolvedor(a) Flutter para a **Bus2**. O aplicativo consome a API [Random User](https://randomuser.me/), permitindo a visualização, filtragem e persistência local de perfis de usuários.

---

## 🚀 Funcionalidades

### ✅ Requisitos Atendidos
- **Tela Inicial**: Lista de usuários buscados automaticamente a cada 5 segundos via **Ticker**.
- **Ticker Implementation**: Uso de `SingleTickerProviderStateMixin` e `Ticker` (em vez de Timer) para gerenciar o intervalo de requisições, conforme solicitado.
- **Persistência Local**: Armazenamento utilizando `GetStorage`.
- **Tela de Detalhes**: Exibição completa dos dados organizada por grupos (Nome, Localização, Contato, etc.).
- **Gerenciamento de Persistência**: Salvar e remover usuários diretamente da tela de detalhes ou da lista de salvos.
- **Navegação Inteligente**: Atualização em tempo real ao retornar da tela de detalhes ou de salvos.

### ✨ Diferenciais e Extras (Além do Desafio)
- **🎨 Splash Screen**: Tela de abertura animada com efeito de *fade* e identidade visual personalizada.
- **🔍 Busca e Filtragem**: Funcionalidade de pesquisa em tempo real na Home para filtrar usuários pelo nome.
- **➕ Controles Avançados**:
  - Botão para **Adicionar Um** usuário manualmente a qualquer momento.
  - Botão para **Deletar Todos** os usuários (com diálogo de confirmação seguro).
- **📊 Contadores Dinâmicos**: Exibição da quantidade de usuários encontrados/salvos com tratamento de singular/plural.
- **🧪 Testes de Widget**: Suite de testes automatizados cobrindo os principais componentes (`PrimaryButton`, `UserListTile`) e telas (`HomeView`, `UserDetailsView`, `SavedUserView`).
- **🔔 Feedback Visual**: Uso de `CustomSnackBar` para notificações de sucesso e erro.
- **🔄 Auto-Refresh**: Na tela de usuários salvos, a lista é sincronizada automaticamente a cada 4 segundos para refletir mudanças externas.

---

## 🏗️ Arquitetura e Tecnologias

O projeto segue os princípios da **Clean Architecture** e o padrão **MVVM (Model-View-ViewModel)** com **Repository Strategy**, garantindo separação de responsabilidades e facilidade de manutenção.

### Tecnologias Utilizadas:
- **Gerenciamento de Estado**: [Flutter BLoC (Cubit)](https://pub.dev/packages/flutter_bloc)
- **Injeção de Dependências**: [GetIt](https://pub.dev/packages/get_it)
- **Persistência**: [GetStorage](https://pub.dev/packages/get_storage)
- **Chamadas HTTP**: [Dio](https://pub.dev/packages/dio)
- **Roteamento**: [GoRouter](https://pub.dev/packages/go_router)
- **Estilização**: Tema customizado (Light/Dark) com tokens de design centralizados.

### Estrutura de Pastas:
```
lib/
 ├── core/          # Configurações globais, temas, rotas e utilitários
 ├── data/          # Implementação de Repositories, Modelos e Services (Data Layer)
 ├── domain/        # Entidades e interfaces de Repositories (Domain Layer)
 ├── presentation/  # Camada de UI (Views e ViewModels/Cubits)
 └── main.dart      # Ponto de entrada
```

---

## 🧪 Como Rodar os Testes

Para garantir a qualidade da interface, foram implementados testes de widget. Para executá-los, use:

```bash
flutter test
```

---

## 📦 Como Executar o Projeto

1. Certifique-se de ter o Flutter instalado na versão estável.
2. Clone o repositório.
3. Execute o comando para obter as dependências:
   ```bash
   flutter pub get
   ```
4. Inicie o aplicativo:
   ```bash
   flutter run
   ```

---

## 🛠️ Build

### Android (APK)
```bash
flutter build apk --release
```

---

**Desenvolvido por Abimael Silva.**
