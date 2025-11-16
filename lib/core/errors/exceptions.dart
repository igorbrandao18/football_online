/// Exceções customizadas da aplicação

/// Exceção base para erros da aplicação
abstract class AppException implements Exception {
  final String message;
  final String? code;

  const AppException(this.message, {this.code});

  @override
  String toString() => message;
}

/// Erro de servidor
class ServerException extends AppException {
  const ServerException(super.message, {super.code});
}

/// Erro de rede
class NetworkException extends AppException {
  const NetworkException(super.message, {super.code});
}

/// Erro de autenticação
class AuthException extends AppException {
  const AuthException(super.message, {super.code});
}

/// Erro de validação
class ValidationException extends AppException {
  const ValidationException(super.message, {super.code});
}

/// Erro de permissão
class PermissionException extends AppException {
  const PermissionException(super.message, {super.code});
}

/// Erro de cache
class CacheException extends AppException {
  const CacheException(super.message, {super.code});
}

