import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/formatters.dart';
import '../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../shared/widgets/division_badge.dart';

class MatchResultScreen extends StatelessWidget {
  final bool isWinner;
  final int playerScore;
  final int opponentScore;
  final int eloChange;
  final int coinsEarned;
  final String opponentName;

  const MatchResultScreen({
    super.key,
    required this.isWinner,
    required this.playerScore,
    required this.opponentScore,
    required this.eloChange,
    required this.coinsEarned,
    required this.opponentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isWinner
                ? [AppColors.success, AppColors.success.withOpacity(0.8)]
                : [AppColors.error, AppColors.error.withOpacity(0.8)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Result Icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Icon(
                    isWinner ? Icons.emoji_events : Icons.sentiment_dissatisfied,
                    size: 70,
                    color: isWinner ? AppColors.accent : AppColors.error,
                  ),
                ),
                const SizedBox(height: 32),
                
                // Result Text
                Text(
                  isWinner ? 'VITÓRIA!' : 'DERROTA',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 16),
                
                // Score
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Placar Final',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Você',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                playerScore.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primary,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              'x',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textSecondary,
                                  ),
                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                opponentName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                opponentScore.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textSecondary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                
                // Rewards
                if (eloChange != 0 || coinsEarned > 0)
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        if (eloChange != 0) ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.trending_up,
                                  color: Colors.white, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                'ELO: ${eloChange > 0 ? '+' : ''}${eloChange}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          if (coinsEarned > 0) const SizedBox(height: 12),
                        ],
                        if (coinsEarned > 0)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.monetization_on,
                                  color: Colors.white, size: 24),
                              const SizedBox(width: 8),
                              Text(
                                '${NumberFormatter.formatCoins(coinsEarned)} moedas',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                
                const Spacer(),
                
                // Action Buttons
                PrimaryButton(
                  label: 'Jogar Novamente',
                  icon: Icons.refresh,
                  onPressed: () {
                    context.go('/home');
                  },
                ),
                const SizedBox(height: 12),
                PrimaryButton(
                  label: 'Voltar ao Menu',
                  icon: Icons.home,
                  onPressed: () {
                    context.go('/home');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

