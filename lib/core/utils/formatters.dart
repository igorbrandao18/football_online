/// Formatadores para exibição de dados

/// Formata números para exibição
class NumberFormatter {
  NumberFormatter._();

  /// Formata número com separador de milhar
  static String formatWithSeparator(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
  }

  /// Formata ELO para exibição
  static String formatElo(int elo) {
    return formatWithSeparator(elo);
  }

  /// Formata moedas para exibição
  static String formatCoins(int coins) {
    if (coins >= 1000000) {
      return '${(coins / 1000000).toStringAsFixed(1)}M';
    } else if (coins >= 1000) {
      return '${(coins / 1000).toStringAsFixed(1)}K';
    }
    return formatWithSeparator(coins);
  }

  /// Formata porcentagem
  static String formatPercentage(double value) {
    return '${(value * 100).toStringAsFixed(1)}%';
  }
}

/// Formata tempo de jogo
class TimeFormatter {
  TimeFormatter._();

  /// Formata segundos para MM:SS
  static String formatMatchTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  /// Formata duração (ex: "5 min")
  static String formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    }
    final hours = minutes ~/ 60;
    final mins = minutes % 60;
    if (mins == 0) {
      return '$hours h';
    }
    return '$hours h $mins min';
  }
}

