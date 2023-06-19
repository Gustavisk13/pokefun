import 'package:flutter/material.dart';
import 'package:pokefun/global/enum/pokemon_action_enum.dart';
import 'package:pokefun/global/themes/app_themes.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final PokemonAction action;

  const ActionCard({
    super.key,
    required this.title,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(
            _getIcon(action: action),
            color: accentColor,
          ),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              title.toUpperCase().replaceAll('-', ' '),
              overflow: TextOverflow.ellipsis,
              style: bodyBold.copyWith(
                color: accentColor,
              ),
            ),
          )
        ],
      ),
    );
  }

  IconData _getIcon({required PokemonAction action}) {
    switch (action) {
      case PokemonAction.ability:
        return Icons.favorite;
      case PokemonAction.move:
        return Icons.whatshot;
    }
  }
}
