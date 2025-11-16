/// Constantes gerais da aplicação
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'Football Online';
  static const String appVersion = '1.0.0';
  
  // Game Constants
  static const int matchDurationMinutes = 90;
  static const int matchDurationRealSeconds = 600; // 10 minutos
  static const int initialElo = 1000;
  static const int initialCoins = 100;
  
  // Matchmaking
  static const int matchmakingTimeoutSeconds = 60;
  static const int eloRange = 200;
  static const int matchConfirmationTimeoutSeconds = 30;
  
  // Connection
  static const int connectionTimeoutSeconds = 30;
  static const int reconnectAttempts = 3;
  
  // Actions
  static const int maxActionsPerSecond = 10;
  static const int maxPauseTimeSeconds = 120;
  static const int maxPausesPerMatch = 1;
  
  // Economy
  static const int quickMatchWinCoins = 50;
  static const int quickMatchDrawCoins = 25;
  static const int rankedMatchWinCoins = 100;
  static const int rankedMatchDrawCoins = 50;
  
  // Divisions
  static const Map<String, DivisionInfo> divisions = {
    'bronze': DivisionInfo(minElo: 0, maxElo: 999, weeklyReward: 50),
    'silver': DivisionInfo(minElo: 1000, maxElo: 1499, weeklyReward: 100),
    'gold': DivisionInfo(minElo: 1500, maxElo: 1999, weeklyReward: 200),
    'platinum': DivisionInfo(minElo: 2000, maxElo: 2499, weeklyReward: 350),
    'diamond': DivisionInfo(minElo: 2500, maxElo: 2999, weeklyReward: 500),
    'master': DivisionInfo(minElo: 3000, maxElo: 3499, weeklyReward: 750),
    'legendary': DivisionInfo(minElo: 3500, maxElo: 9999, weeklyReward: 1000),
  };
  
  // ELO Calculation
  static const int eloKFactor = 32;
}

class DivisionInfo {
  final int minElo;
  final int maxElo;
  final int weeklyReward;
  
  const DivisionInfo({
    required this.minElo,
    required this.maxElo,
    required this.weeklyReward,
  });
}

