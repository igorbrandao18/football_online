# ⚽ Football Online

> **Aplicativo mobile de futebol online multiplayer em tempo real**  
> Desenvolvido em Flutter | Backend: Supabase (PostgreSQL)

[![Flutter](https://img.shields.io/badge/Flutter-3.3.4+-02569B?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.3.4+-0175C2?logo=dart)](https://dart.dev)
[![Supabase](https://img.shields.io/badge/Supabase-PostgreSQL-3ECF8E?logo=supabase)](https://supabase.com)
[![Riverpod](https://img.shields.io/badge/Riverpod-2.4.9-FF6B6B)](https://riverpod.dev)

## 🎮 Features

- 🎯 **Partidas em Tempo Real** - Sincronização precisa com servidor autoritativo
- 🏆 **Sistema de Ranking** - ELO com 7 divisões (Bronze → Lendário)
- 🏅 **Torneios** - Competições semanais/mensais com premiações
- 👥 **Sistema Social** - Amigos, ligas privadas, chat
- 📊 **Estatísticas** - Histórico completo, conquistas e títulos
- 💰 **Economia do Jogo** - Moedas, melhorias de time, cosméticos

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                    # Entry point
│
├── core/                        # Código compartilhado
│   ├── constants/              # Constantes (app, API, game)
│   ├── theme/                  # Tema, cores, estilos de texto
│   ├── utils/                  # Utilitários (validators, formatters, ELO)
│   └── errors/                 # Exceções e failures
│
├── features/                    # Features (Clean Architecture)
│   ├── auth/                   # Autenticação
│   │   ├── data/              # Models, repositories, datasources
│   │   ├── domain/            # Entities, repository interfaces, use cases
│   │   └── presentation/      # Screens, widgets, providers
│   ├── match/                 # Partidas
│   ├── ranking/               # Ranking e ELO
│   ├── tournament/            # Torneios
│   ├── profile/               # Perfil do usuário
│   └── social/                # Amigos, chat, ligas
│
└── shared/                     # Componentes compartilhados
    ├── widgets/               # Widgets reutilizáveis
    ├── utils/                 # Extensions e utilitários
    └── extensions/           # Extensions Dart
```

## 🚀 Getting Started

### Pré-requisitos

- Flutter SDK 3.3.4 ou superior
- Dart 3.3.4 ou superior
- Conta no Supabase (para backend)

### Instalação

1. **Clone o repositório**
```bash
git clone https://github.com/igorbrandao18/football_online.git
cd football_online
```

2. **Instale as dependências**
```bash
flutter pub get
```

3. **Configure o Supabase**
   - Crie um projeto no [Supabase](https://supabase.com)
   - Configure as variáveis de ambiente (em breve)
   - Execute as migrações do banco de dados (em breve)

4. **Execute o app**
```bash
flutter run
```

## 🛠️ Tech Stack

### Frontend
- **Flutter** 3.3.4+ - Framework multiplataforma
- **Riverpod** 2.4.9 - State management
- **GoRouter** 13.0.0 - Navegação declarativa
- **WebSocket Channel** 2.4.0 - Comunicação em tempo real

### Backend
- **Supabase** - Backend as a Service
  - PostgreSQL - Banco de dados relacional
  - Supabase Auth - Autenticação
  - Supabase Realtime - Sincronização em tempo real
  - Edge Functions - Lógica de servidor (Deno)

## 📊 Status de Desenvolvimento

### ✅ Fase 1 - MVP (Em Progresso)
- [x] Setup do projeto e estrutura
- [x] Estrutura de pastas (Clean Architecture)
- [x] Tema e design system
- [x] Modelos básicos (User, Match)
- [x] Tela inicial
- [ ] Integração Supabase
- [ ] Autenticação
- [ ] Matchmaking
- [ ] Partida básica
- [ ] Sistema de ranking

### 🔄 Fase 2 - Core Features (Planejado)
- [ ] Partidas rankeadas
- [ ] Sistema de amigos
- [ ] Chat básico
- [ ] Perfil completo
- [ ] Histórico de partidas

### ⏳ Fase 3 - Recursos Avançados (Planejado)
- [ ] Torneios
- [ ] Liga de amigos
- [ ] Conquistas
- [ ] Economia do jogo
- [ ] Notificações push

### 🎨 Fase 4 - Polimento (Planejado)
- [ ] Animações avançadas
- [ ] Otimizações
- [ ] Testes automatizados
- [ ] Localização (i18n)

## 📖 Documentação

Para mais detalhes sobre:
- **Especificações completas**: Veja [rules.mdc](./rules.mdc)
- **Arquitetura**: Clean Architecture + Feature-First
- **Padrões de código**: Seguir convenções do Flutter

## 🎯 Roadmap

Veja o roadmap completo e detalhado no arquivo [rules.mdc](./rules.mdc), seção "Roadmap e Fases".

## 🤝 Contribuindo

Este é um projeto privado. Para contribuições, entre em contato com os mantenedores.

## 📝 Licença

Private project - All rights reserved

---

**Desenvolvido com ❤️ usando Flutter e Supabase**
