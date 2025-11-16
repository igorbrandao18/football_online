import 'dart:math' as math;
import '../constants/app_constants.dart';

/// Calculadora de ELO para sistema de ranking
class EloCalculator {
  EloCalculator._();

  /// Calcula o novo ELO após uma partida
  /// 
  /// [currentElo] - ELO atual do jogador
  /// [opponentElo] - ELO do oponente
  /// [result] - Resultado: 1.0 (vitória), 0.5 (empate), 0.0 (derrota)
  /// 
  /// Retorna o novo ELO do jogador
  static int calculateNewElo(
    int currentElo,
    int opponentElo,
    double result,
  ) {
    final expected = _calculateExpectedScore(currentElo, opponentElo);
    final newElo = currentElo + 
        (AppConstants.eloKFactor * (result - expected));
    
    return newElo.round();
  }

  /// Calcula a pontuação esperada baseada na diferença de ELO
  static double _calculateExpectedScore(int playerElo, int opponentElo) {
    final eloDifference = opponentElo - playerElo;
    return 1.0 / (1.0 + _powerOf10(eloDifference / 400.0));
  }

  /// Calcula 10 elevado a x
  static double _powerOf10(double exponent) {
    return math.pow(10.0, exponent).toDouble();
  }

  /// Calcula o ELO para ambos os jogadores após uma partida
  static Map<String, int> calculateMatchElo(
    int player1Elo,
    int player2Elo,
    int player1Score,
    int player2Score,
  ) {
    double player1Result;
    
    if (player1Score > player2Score) {
      player1Result = 1.0; // Vitória
    } else if (player1Score < player2Score) {
      player1Result = 0.0; // Derrota
    } else {
      player1Result = 0.5; // Empate
    }

    final newPlayer1Elo = calculateNewElo(
      player1Elo,
      player2Elo,
      player1Result,
    );

    final newPlayer2Elo = calculateNewElo(
      player2Elo,
      player1Elo,
      1.0 - player1Result,
    );

    return {
      'player1': newPlayer1Elo,
      'player2': newPlayer2Elo,
    };
  }

  /// Retorna a divisão baseada no ELO
  static String getDivision(int elo) {
    for (final entry in AppConstants.divisions.entries) {
      if (elo >= entry.value.minElo && elo <= entry.value.maxElo) {
        return entry.key;
      }
    }
    return 'bronze'; // Default
  }
}

