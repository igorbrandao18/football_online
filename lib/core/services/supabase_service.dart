import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';
import '../constants/api_constants.dart';

/// Serviço de inicialização e acesso ao Supabase
class SupabaseService {
  SupabaseService._();

  static SupabaseClient? _client;

  /// Inicializa o Supabase
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: SupabaseConfig.supabaseUrl,
      anonKey: SupabaseConfig.supabaseAnonKey,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );

    _client = Supabase.instance.client;
  }

  /// Retorna o cliente Supabase
  static SupabaseClient get client {
    if (_client == null) {
      throw Exception(
        'Supabase não foi inicializado. Chame SupabaseService.initialize() primeiro.',
      );
    }
    return _client!;
  }

  /// Retorna o cliente de autenticação
  static GoTrueClient get auth => client.auth;

  /// Retorna o cliente de banco de dados
  static PostgrestClient get database => client.from;

  /// Retorna o cliente de realtime
  static RealtimeClient get realtime => client.realtime;

  /// Verifica se o usuário está autenticado
  static bool get isAuthenticated => auth.currentUser != null;

  /// Retorna o usuário atual
  static User? get currentUser => auth.currentUser;

  /// Retorna o ID do usuário atual
  static String? get currentUserId => auth.currentUser?.id;

  /// Faz logout
  static Future<void> signOut() async {
    await auth.signOut();
  }
}

