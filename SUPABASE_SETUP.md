# 🗄️ Configuração do Supabase

Este documento descreve a configuração e integração do Supabase no projeto Football Online.

## ✅ Status da Integração

- [x] Projeto Supabase criado e configurado
- [x] Migrações do banco de dados aplicadas
- [x] Supabase Flutter SDK instalado
- [x] Serviço de inicialização criado
- [x] Data source de autenticação criado

## 📊 Estrutura do Banco de Dados

### Tabelas Criadas

1. **`profiles`** - Perfis de usuário (extend Supabase Auth)
   - `id` (UUID, PK, FK → auth.users)
   - `username` (TEXT, UNIQUE)
   - `avatar_url` (TEXT)
   - `elo` (INTEGER, default: 1000)
   - `division` (TEXT, default: 'bronze')
   - `wins`, `losses`, `draws` (INTEGER)
   - `coins` (INTEGER, default: 100)
   - `created_at`, `updated_at` (TIMESTAMP)

2. **`matches`** - Partidas
   - `id` (UUID, PK)
   - `player1_id`, `player2_id` (UUID, FK → profiles)
   - `player1_team`, `player2_team` (TEXT)
   - `player1_score`, `player2_score` (INTEGER)
   - `status` (TEXT: 'waiting', 'in_progress', 'finished', 'cancelled')
   - `type` (TEXT: 'quick', 'ranked', 'tournament', 'friendly')
   - `winner_id` (UUID, FK → profiles)
   - `created_at`, `started_at`, `finished_at` (TIMESTAMP)

3. **`rankings`** - Rankings e ELO
   - `user_id` (UUID, PK, FK → profiles)
   - `elo` (INTEGER)
   - `division` (TEXT)
   - `position` (INTEGER)
   - `updated_at` (TIMESTAMP)

4. **`tournaments`** - Torneios
   - `id` (UUID, PK)
   - `name`, `description` (TEXT)
   - `start_date`, `end_date` (TIMESTAMP)
   - `max_participants`, `current_participants` (INTEGER)
   - `status` (TEXT: 'registration', 'in_progress', 'finished', 'cancelled')
   - `winner_id` (UUID, FK → profiles)
   - `prize_pool` (INTEGER)
   - `created_at` (TIMESTAMP)

5. **`tournament_participants`** - Participantes de torneios
   - `tournament_id` (UUID, FK → tournaments)
   - `user_id` (UUID, FK → profiles)
   - `position` (INTEGER)
   - `joined_at` (TIMESTAMP)
   - PRIMARY KEY (tournament_id, user_id)

6. **`friendships`** - Amizades
   - `id` (UUID, PK)
   - `user1_id`, `user2_id` (UUID, FK → profiles)
   - `status` (TEXT: 'pending', 'accepted', 'blocked')
   - `created_at`, `updated_at` (TIMESTAMP)
   - UNIQUE (user1_id, user2_id)

### Row Level Security (RLS)

Todas as tabelas têm RLS habilitado com políticas apropriadas:
- **Profiles**: Todos podem ler, usuários podem atualizar apenas o próprio perfil
- **Matches**: Usuários podem ver/criar/atualizar apenas suas próprias partidas
- **Rankings**: Todos podem ler
- **Tournaments**: Todos podem ler, usuários podem participar
- **Friendships**: Usuários podem ver/criar/atualizar apenas suas próprias amizades

## 🔧 Configuração

### Credenciais

As credenciais do Supabase estão configuradas em:
- `lib/core/config/supabase_config.dart`

**⚠️ IMPORTANTE**: Em produção, mova essas credenciais para variáveis de ambiente!

### Inicialização

O Supabase é inicializado no `main.dart`:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupabaseService.initialize();
  runApp(...);
}
```

## 📝 Uso

### Acessar o Cliente Supabase

```dart
import 'package:football_online/core/services/supabase_service.dart';

// Cliente completo
final client = SupabaseService.client;

// Apenas autenticação
final auth = SupabaseService.auth;

// Apenas banco de dados
final db = SupabaseService.database;

// Apenas realtime
final realtime = SupabaseService.realtime;
```

### Exemplo: Buscar Perfis

```dart
final response = await SupabaseService.client
    .from('profiles')
    .select()
    .order('elo', ascending: false)
    .limit(10);
```

### Exemplo: Autenticação

```dart
// Login
final response = await SupabaseService.auth.signInWithPassword(
  email: 'user@example.com',
  password: 'password123',
);

// Verificar se está autenticado
if (SupabaseService.isAuthenticated) {
  final user = SupabaseService.currentUser;
}
```

## 🔐 Segurança

- ✅ RLS habilitado em todas as tabelas
- ✅ Políticas de segurança configuradas
- ✅ Validações de dados no banco (CHECK constraints)
- ✅ Foreign keys com CASCADE/SET NULL apropriados

## 📚 Recursos

- [Documentação Supabase](https://supabase.com/docs)
- [Supabase Flutter SDK](https://supabase.com/docs/reference/dart/introduction)
- [Row Level Security](https://supabase.com/docs/guides/auth/row-level-security)

## 🚀 Próximos Passos

1. Implementar autenticação completa (login, signup, logout)
2. Criar repositórios para cada feature
3. Implementar realtime para partidas
4. Criar Edge Functions para lógica de servidor (matchmaking, ELO calculation)

---

**Última atualização**: 2024

