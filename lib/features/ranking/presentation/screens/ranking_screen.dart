import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/formatters.dart';
import '../../../../../shared/widgets/division_badge.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Buscar dados reais do Supabase
    final mockRankings = List.generate(
      20,
      (index) => {
        'position': index + 1,
        'username': 'Jogador${index + 1}',
        'elo': 3500 - (index * 50),
        'division': _getDivision(3500 - (index * 50)),
        'wins': 100 - index,
        'losses': 20 + index,
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header with user position
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
                Text(
                  'Sua Posição',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '#${1234}',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DivisionBadge(division: 'gold'),
                    const SizedBox(width: 16),
                    Text(
                      NumberFormatter.formatElo(1500),
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
          
          // Rankings list
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: mockRankings.length,
              itemBuilder: (context, index) {
                final ranking = mockRankings[index];
                final isTopThree = index < 3;
                
                return Card(
                  elevation: isTopThree ? 8 : 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: isTopThree
                        ? BorderSide(color: AppColors.accent, width: 2)
                        : BorderSide.none,
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: isTopThree
                            ? AppColors.accent.withOpacity(0.2)
                            : AppColors.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '#${ranking['position']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: isTopThree
                                ? AppColors.accent
                                : AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      ranking['username'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: [
                        DivisionBadge(
                          division: ranking['division'] as String,
                          showLabel: true,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${ranking['wins']}V / ${ranking['losses']}D',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      NumberFormatter.formatElo(
                        ranking['elo'] as int,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String _getDivision(int elo) {
    if (elo >= 3500) return 'legendary';
    if (elo >= 3000) return 'master';
    if (elo >= 2500) return 'diamond';
    if (elo >= 2000) return 'platinum';
    if (elo >= 1500) return 'gold';
    if (elo >= 1000) return 'silver';
    return 'bronze';
  }
}

