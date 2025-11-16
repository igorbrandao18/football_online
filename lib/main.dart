import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/app_theme.dart';
import 'core/services/supabase_service.dart';
import 'core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar Supabase
  await SupabaseService.initialize();
  
  runApp(
    const ProviderScope(
      child: FootballOnlineApp(),
    ),
  );
}

class FootballOnlineApp extends StatelessWidget {
  const FootballOnlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Football Online',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: AppRouter.router,
    );
  }
}
