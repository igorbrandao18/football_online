import 'package:go_router/go_router.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/match/presentation/screens/matchmaking_screen.dart';
import '../../features/match/presentation/screens/match_result_screen.dart';
import '../../features/ranking/presentation/screens/ranking_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';

/// Configuração de rotas da aplicação
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/matchmaking',
        name: 'matchmaking',
        builder: (context, state) {
          final matchType = state.uri.queryParameters['type'] ?? 'quick';
          return MatchmakingScreen(matchType: matchType);
        },
      ),
      GoRoute(
        path: '/ranking',
        name: 'ranking',
        builder: (context, state) => const RankingScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/match-result',
        name: 'match-result',
        builder: (context, state) {
          final isWinner = state.uri.queryParameters['winner'] == 'true';
          final playerScore = int.tryParse(
                  state.uri.queryParameters['playerScore'] ?? '0') ??
              0;
          final opponentScore = int.tryParse(
                  state.uri.queryParameters['opponentScore'] ?? '0') ??
              0;
          final eloChange = int.tryParse(
                  state.uri.queryParameters['eloChange'] ?? '0') ??
              0;
          final coinsEarned = int.tryParse(
                  state.uri.queryParameters['coinsEarned'] ?? '0') ??
              0;
          final opponentName =
              state.uri.queryParameters['opponentName'] ?? 'Oponente';

          return MatchResultScreen(
            isWinner: isWinner,
            playerScore: playerScore,
            opponentScore: opponentScore,
            eloChange: eloChange,
            coinsEarned: coinsEarned,
            opponentName: opponentName,
          );
        },
      ),
    ],
  );
}

