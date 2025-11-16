import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../shared/widgets/buttons/secondary_button.dart';
import '../../../../../shared/widgets/loading/loading_indicator.dart';

class MatchmakingScreen extends StatefulWidget {
  final String matchType; // 'quick' or 'ranked'

  const MatchmakingScreen({
    super.key,
    required this.matchType,
  });

  @override
  State<MatchmakingScreen> createState() => _MatchmakingScreenState();
}

class _MatchmakingScreenState extends State<MatchmakingScreen> {
  int _elapsedSeconds = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
    _startMatchmaking();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsedSeconds++;
        });
      }
    });
  }

  Future<void> _startMatchmaking() async {
    // TODO: Implementar matchmaking real
    await Future.delayed(const Duration(seconds: 3));
    
    if (mounted) {
      // TODO: Navigate to match screen when opponent found
      Navigator.of(context).pop();
      _showMatchFound();
    }
  }

  void _showMatchFound() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text('Oponente Encontrado!'),
        content: const Text('Preparando partida...'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${secs.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.matchType == 'quick' ? 'Partida Rápida' : 'Partida Rankeada',
        ),
        centerTitle: true,
      ),
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
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Animated searching icon
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
                      Icons.search,
                      size: 60,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Searching text
                  Text(
                    'Buscando oponente...',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Time elapsed
                  Text(
                    _formatTime(_elapsedSeconds),
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFeatures: [const FontFeature.tabularFigures()],
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tempo de espera',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white.withOpacity(0.8),
                        ),
                  ),
                  const SizedBox(height: 60),
                  
                  // Loading indicator
                  const LoadingIndicator(
                    message: 'Aguardando jogadores...',
                    color: Colors.white,
                  ),
                  const SizedBox(height: 40),
                  
                  // Cancel button
                  SecondaryButton(
                    label: 'Cancelar',
                    icon: Icons.close,
                    onPressed: () {
                      _timer?.cancel();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

