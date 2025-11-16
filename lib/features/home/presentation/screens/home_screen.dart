import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../../shared/widgets/cards/game_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                
                // Logo/Icon
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
                  child: const Icon(
                    Icons.sports_soccer,
                    size: 70,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 24),
                
                // App Title
                Text(
                  'Football Online',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Play, Compete, Win',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
                const SizedBox(height: 40),
                
                // Main Menu Cards
                GameCard(
                  title: 'Play Now',
                  subtitle: 'Partida rápida - Sem ranking',
                  icon: Icons.play_arrow,
                  iconColor: AppColors.success,
                  onTap: () {
                    context.push('/matchmaking?type=quick');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: 'Ranked Match',
                  subtitle: 'Partida rankeada - Ganhe ELO',
                  icon: Icons.leaderboard,
                  iconColor: AppColors.secondary,
                  onTap: () {
                    context.push('/matchmaking?type=ranked');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: 'Ranking',
                  subtitle: 'Veja os melhores jogadores',
                  icon: Icons.trending_up,
                  iconColor: AppColors.accent,
                  onTap: () {
                    context.push('/ranking');
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: 'Tournaments',
                  subtitle: 'Participe de torneios',
                  icon: Icons.emoji_events,
                  iconColor: AppColors.accent,
                  onTap: () {
                    _showComingSoon(context);
                  },
                ),
                const SizedBox(height: 16),
                GameCard(
                  title: 'Profile',
                  subtitle: 'Seu perfil e estatísticas',
                  icon: Icons.person,
                  iconColor: Colors.purple,
                  onTap: () {
                    context.push('/profile');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Em Breve'),
        content: const Text('Esta funcionalidade está em desenvolvimento. Fique ligado!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
