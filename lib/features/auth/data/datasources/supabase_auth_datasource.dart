import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/services/supabase_service.dart';
import '../../../../core/errors/exceptions.dart';

/// Data source para autenticação via Supabase
class SupabaseAuthDataSource {
  final SupabaseClient _client = SupabaseService.client;

  /// Faz login com email e senha
  Future<AuthResponse> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException('Erro ao fazer login: ${e.toString()}');
    }
  }

  /// Cria uma nova conta
  Future<AuthResponse> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      return response;
    } on AuthException catch (e) {
      throw AuthException(e.message);
    } catch (e) {
      throw ServerException('Erro ao criar conta: ${e.toString()}');
    }
  }

  /// Faz logout
  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } catch (e) {
      throw ServerException('Erro ao fazer logout: ${e.toString()}');
    }
  }

  /// Retorna o usuário atual
  User? getCurrentUser() {
    return _client.auth.currentUser;
  }

  /// Verifica se há um usuário autenticado
  bool get isAuthenticated => _client.auth.currentUser != null;

  /// Stream de mudanças de autenticação
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}

