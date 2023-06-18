import 'package:flutter/material.dart';
import 'package:pokefun/global/themes/app_themes.dart';

class StatIndicatorWidget extends StatelessWidget {
  final String stat;
  final num value;

  const StatIndicatorWidget({
    super.key,
    required this.stat,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _getColor(stat: stat),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getIcon(stat: stat),
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 2),
                Text(
                  '$value',
                  style: bodyBold.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${stat.toUpperCase().replaceAll('-', ' ')} ${_getMeasure(stat: stat)}',
            style: bodyBold /* .copyWith(fontSize: 12) */,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  String _getMeasure({required String stat}) {
    switch (stat) {
      case 'height':
        return '(m)';
      case 'weight':
        return '(kg)';
      default:
        return '';
    }
  }

  IconData _getIcon({required String stat}) {
    //TODO: implement game icons
    switch (stat) {
      case 'hp':
        return Icons.favorite;
      case 'attack':
        return Icons.whatshot;
      case 'defense':
        return Icons.shield;
      case 'special-attack':
        return Icons.flash_on;
      case 'special-defense':
        return Icons.bolt;
      case 'speed':
        return Icons.speed;
      case 'height':
        return Icons.height;
      case 'weight':
        return Icons.line_weight;
      default:
        return Icons.help;
    }
  }

  Color _getColor({required String stat}) {
    switch (stat) {
      case 'hp':
        return Colors.red;
      case 'attack':
        return Colors.orange;
      case 'defense':
        return Colors.yellow;
      case 'special-attack':
        return Colors.purple;
      case 'special-defense':
        return Colors.pink;
      case 'speed':
        return Colors.green;
      case 'height':
        return Colors.blue;
      case 'weight':
        return Colors.blueGrey;
      default:
        return Colors.grey;
    }
  }
}
