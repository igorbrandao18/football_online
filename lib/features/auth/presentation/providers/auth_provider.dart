import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider de autenticação
/// TODO: Implementar lógica de autenticação com Supabase
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState.initial());

  // TODO: Implementar métodos de autenticação
  Future<void> login(String email, String password) async {
    state = const AuthState.loading();
    // Implementar login
  }

  Future<void> signUp(String email, String password, String username) async {
    state = const AuthState.loading();
    // Implementar cadastro
  }

  Future<void> logout() async {
    state = const AuthState.initial();
    // Implementar logout
  }
}

/// Estado de autenticação
class AuthState {
  final bool isAuthenticated;
  final bool isLoading;
  final String? error;

  const AuthState({
    required this.isAuthenticated,
    required this.isLoading,
    this.error,
  });

  const AuthState.initial()
      : isAuthenticated = false,
        isLoading = false,
        error = null;

  const AuthState.loading()
      : isAuthenticated = false,
        isLoading = true,
        error = null;

  const AuthState.authenticated()
      : isAuthenticated = true,
        isLoading = false,
        error = null;

  const AuthState.error(this.error)
      : isAuthenticated = false,
        isLoading = false;
}

/// Provider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

