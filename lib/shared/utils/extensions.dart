/// Extensions úteis para o projeto

extension StringExtensions on String {
  /// Capitaliza a primeira letra
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// Verifica se é um email válido
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }
}

extension DateTimeExtensions on DateTime {
  /// Formata data para exibição
  String toDisplayString() {
    return '${day.toString().padLeft(2, '0')}/'
        '${month.toString().padLeft(2, '0')}/'
        '$year';
  }

  /// Formata data e hora para exibição
  String toDisplayStringWithTime() {
    return '${toDisplayString()} ${hour.toString().padLeft(2, '0')}:'
        '${minute.toString().padLeft(2, '0')}';
  }

  /// Retorna tempo relativo (ex: "há 2 horas")
  String toRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();
      return 'há $years ${years == 1 ? 'ano' : 'anos'}';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();
      return 'há $months ${months == 1 ? 'mês' : 'meses'}';
    } else if (difference.inDays > 0) {
      return 'há ${difference.inDays} ${difference.inDays == 1 ? 'dia' : 'dias'}';
    } else if (difference.inHours > 0) {
      return 'há ${difference.inHours} ${difference.inHours == 1 ? 'hora' : 'horas'}';
    } else if (difference.inMinutes > 0) {
      return 'há ${difference.inMinutes} ${difference.inMinutes == 1 ? 'minuto' : 'minutos'}';
    } else {
      return 'agora';
    }
  }
}

extension ContextExtensions on BuildContext {
  /// Retorna o tema atual
  ThemeData get theme => Theme.of(this);

  /// Retorna as cores do tema
  ColorScheme get colors => theme.colorScheme;

  /// Retorna o tamanho da tela
  Size get screenSize => MediaQuery.of(this).size;

  /// Retorna a largura da tela
  double get screenWidth => screenSize.width;

  /// Retorna a altura da tela
  double get screenHeight => screenSize.height;

  /// Mostra um snackbar
  void showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.error : colors.primary,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

