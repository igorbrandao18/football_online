# 🏗️ Arquitetura do Projeto

Este documento descreve a arquitetura e organização do código do Football Online.

## 📐 Princípios Arquiteturais

### Clean Architecture

O projeto segue os princípios da **Clean Architecture**, organizando o código em camadas independentes:

```
┌─────────────────────────────────────┐
│      Presentation Layer             │  ← UI, Widgets, Providers
│  (Flutter Widgets, Riverpod)        │
└──────────────┬──────────────────────┘
                │
┌───────────────▼──────────────────────┐
│       Domain Layer                    │  ← Business Logic
│  (Entities, Use Cases, Interfaces)   │
└──────────────┬──────────────────────┘
                │
┌───────────────▼──────────────────────┐
│        Data Layer                     │  ← Data Sources
│  (Repositories, Models, APIs)        │
└───────────────────────────────────────┘
```

### Feature-First Organization

As features são organizadas por funcionalidade, não por tipo de arquivo:

```
features/
├── auth/          # Tudo relacionado a autenticação
├── match/         # Tudo relacionado a partidas
├── ranking/       # Tudo relacionado a ranking
└── ...
```

Cada feature contém suas próprias camadas (data, domain, presentation).

## 📁 Estrutura de Pastas

### `/lib/core`

Código compartilhado que não pertence a nenhuma feature específica:

- **`constants/`**: Constantes da aplicação
  - `app_constants.dart`: Constantes gerais (ELO inicial, duração de partidas, etc.)
  - `api_constants.dart`: URLs, endpoints, tabelas do Supabase
  - `game_constants.dart`: Regras do jogo (futuro)

- **`theme/`**: Sistema de design
  - `app_theme.dart`: Configuração do tema Material 3
  - `colors.dart`: Paleta de cores
  - `text_styles.dart`: Tipografia

- **`utils/`**: Utilitários gerais
  - `validators.dart`: Validação de formulários
  - `formatters.dart`: Formatação de números, datas, etc.
  - `elo_calculator.dart`: Cálculo de ELO

- **`errors/`**: Tratamento de erros
  - `exceptions.dart`: Exceções customizadas
  - `failures.dart`: Failures para Either pattern (futuro)

### `/lib/features`

Cada feature segue a estrutura Clean Architecture:

```
feature_name/
├── data/
│   ├── models/           # Modelos de dados (JSON serialization)
│   ├── repositories/     # Implementação dos repositórios
│   └── datasources/      # Fontes de dados (Supabase, API)
│
├── domain/
│   ├── entities/         # Entidades de negócio (sem dependências)
│   ├── repositories/     # Interfaces dos repositórios
│   └── usecases/         # Casos de uso (lógica de negócio)
│
└── presentation/
    ├── screens/          # Telas da feature
    ├── widgets/          # Widgets específicos da feature
    └── providers/        # Providers Riverpod
```

### `/lib/shared`

Componentes compartilhados entre features:

- **`widgets/`**: Widgets reutilizáveis
  - `loading/`: LoadingIndicator, etc.
  - `buttons/`: CustomButton, etc.
  - `cards/`: MatchCard, UserCard, etc.

- **`utils/`**: Extensions e utilitários compartilhados
  - `extensions.dart`: Extensions úteis (String, DateTime, BuildContext)

## 🔄 Fluxo de Dados

### Exemplo: Buscar Partidas

```
1. UI (MatchScreen)
   ↓ chama
2. Provider (matchProvider)
   ↓ chama
3. Use Case (GetMatchesUseCase)
   ↓ chama
4. Repository Interface (MatchRepository)
   ↓ implementado por
5. Repository Implementation (MatchRepositoryImpl)
   ↓ chama
6. Data Source (SupabaseMatchDataSource)
   ↓ retorna
7. Model (MatchModel)
   ↓ convertido para
8. Entity (Match)
   ↓ retorna para
9. Provider → UI atualiza
```

## 🎯 Convenções

### Nomenclatura

- **Arquivos**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variáveis/Funções**: `camelCase`
- **Constantes**: `UPPER_SNAKE_CASE`

### Exemplos

```dart
// Arquivo: user_profile_screen.dart
class UserProfileScreen extends StatelessWidget { ... }

// Arquivo: auth_repository.dart
abstract class AuthRepository { ... }
class AuthRepositoryImpl implements AuthRepository { ... }

// Arquivo: match_provider.dart
final matchProvider = StateNotifierProvider<MatchNotifier, MatchState>((ref) {
  return MatchNotifier(ref.read(matchRepositoryProvider));
});
```

### Organização de Imports

```dart
// 1. Dart core
import 'dart:math';

// 2. Flutter
import 'package:flutter/material.dart';

// 3. Pacotes externos
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 4. Core (projeto)
import 'package:football_online/core/theme/app_theme.dart';
import 'package:football_online/core/constants/app_constants.dart';

// 5. Features
import 'package:football_online/features/match/presentation/screens/match_screen.dart';

// 6. Shared
import 'package:football_online/shared/widgets/loading/loading_indicator.dart';
```

## 🧩 State Management (Riverpod)

### Tipos de Providers

1. **StateProvider**: Estado simples
```dart
final counterProvider = StateProvider<int>((ref) => 0);
```

2. **FutureProvider**: Dados assíncronos
```dart
final userProvider = FutureProvider<User>((ref) async {
  return await ref.read(authRepositoryProvider).getCurrentUser();
});
```

3. **StateNotifierProvider**: Estado complexo
```dart
final matchProvider = StateNotifierProvider<MatchNotifier, MatchState>((ref) {
  return MatchNotifier(ref.read(matchRepositoryProvider));
});
```

### Regras

- Providers devem estar na camada `presentation/providers/`
- Um provider por feature (ou sub-feature)
- Usar `ref.read()` para dependências, `ref.watch()` para observar mudanças

## 🗄️ Banco de Dados (Supabase)

### Estrutura de Tabelas

Ver `rules.mdc` seção "APIs e Integrações" para o schema completo.

### Acesso aos Dados

```dart
// Data Source
class SupabaseMatchDataSource {
  final SupabaseClient _client;
  
  Future<List<MatchModel>> getMatches() async {
    final response = await _client
        .from('matches')
        .select()
        .order('created_at', ascending: false);
    return (response as List).map((json) => MatchModel.fromJson(json)).toList();
  }
}
```

## 🧪 Testes

### Estrutura

```
test/
├── unit/              # Testes unitários
│   ├── features/
│   └── core/
├── widget/            # Testes de widgets
└── integration/       # Testes de integração
```

### Cobertura

- Mínimo: 70%
- Ideal: 80%+

## 📚 Recursos Adicionais

- **Especificações completas**: [rules.mdc](./rules.mdc)
- **README**: [README.md](./README.md)
- **Flutter Clean Architecture**: [Artigo](https://resocoder.com/flutter-clean-architecture-tdd/)
- **Riverpod Docs**: [Documentação](https://riverpod.dev)

---

**Última atualização**: 2024

