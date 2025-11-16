import 'package:flutter/material.dart';
import '../../../../core/theme/colors.dart';

/// Badge de divisão do ranking
class DivisionBadge extends StatelessWidget {
  final String division;
  final bool showLabel;

  const DivisionBadge({
    super.key,
    required this.division,
    this.showLabel = true,
  });

  static Map<String, Map<String, dynamic>> _divisionData = {
    'bronze': {
      'color': Color(0xFFCD7F32),
      'label': 'Bronze',
      'icon': Icons.looks_one,
    },
    'silver': {
      'color': Color(0xFFC0C0C0),
      'label': 'Prata',
      'icon': Icons.looks_two,
    },
    'gold': {
      'color': Color(0xFFFFD700),
      'label': 'Ouro',
      'icon': Icons.emoji_events,
    },
    'platinum': {
      'color': Color(0xFFE5E4E2),
      'label': 'Platina',
      'icon': Icons.diamond,
    },
    'diamond': {
      'color': Color(0xFFB9F2FF),
      'label': 'Diamante',
      'icon': Icons.diamond_outlined,
    },
    'master': {
      'color': Color(0xFF9B59B6),
      'label': 'Mestre',
      'icon': Icons.stars,
    },
    'legendary': {
      'color': Color(0xFFFF6B00),
      'label': 'Lendário',
      'icon': Icons.workspace_premium,
    },
  };

  @override
  Widget build(BuildContext context) {
    final data = _divisionData[division.toLowerCase()] ?? _divisionData['bronze']!;
    final color = data['color'] as Color;
    final label = data['label'] as String;
    final icon = data['icon'] as IconData;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color, width: 2),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 18),
          if (showLabel) ...[
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

