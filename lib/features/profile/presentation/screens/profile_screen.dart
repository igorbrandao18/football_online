import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/formatters.dart';
import '../../../../../shared/widgets/division_badge.dart';
import '../../../../../shared/widgets/cards/game_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Buscar dados reais do usuário
    final userStats = {
      'username': 'Jogador123',
      'elo': 1500,
      'division': 'gold',
      'wins': 45,
      'losses': 20,
      'draws': 5,
      'coins': 1250,
      'totalMatches': 70,
    };

    final winRate = (userStats['wins'] as int) /
        (userStats['totalMatches'] as int);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.primaryDark],
                ),
              ),
              child: Column(
                children: [
                  // Avatar
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Username
                  Text(
                    userStats['username'] as String,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Division and ELO
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DivisionBadge(division: userStats['division'] as String),
                      const SizedBox(width: 16),
                      Text(
                        NumberFormatter.formatElo(userStats['elo'] as int),
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Stats Cards
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      label: 'Vitórias',
                      value: userStats['wins'].toString(),
                      icon: Icons.emoji_events,
                      color: AppColors.success,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: 'Derrotas',
                      value: userStats['losses'].toString(),
                      icon: Icons.trending_down,
                      color: AppColors.error,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      label: 'Empates',
                      value: userStats['draws'].toString(),
                      icon: Icons.remove,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            
            // Win Rate
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.trending_up, color: AppColors.success),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Taxa de Vitória',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              NumberFormatter.formatPercentage(winRate),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.success,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Coins
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Icon(Icons.monetization_on,
                          color: AppColors.accent),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Moedas',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              NumberFormatter.formatCoins(
                                userStats['coins'] as int,
                              ),
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: AppColors.accent,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Menu Options
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  GameCard(
                    title: 'Histórico de Partidas',
                    subtitle: 'Veja suas partidas anteriores',
                    icon: Icons.history,
                    onTap: () {
                      // TODO: Navigate to match history
                    },
                  ),
                  const SizedBox(height: 12),
                  GameCard(
                    title: 'Conquistas',
                    subtitle: 'Suas conquistas e títulos',
                    icon: Icons.stars,
                    onTap: () {
                      // TODO: Navigate to achievements
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

