import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/themes/app_themes.dart';

class FavoriteButton extends StatefulWidget {
  final double iconSize;
  const FavoriteButton({
    super.key,
    this.iconSize = 24,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.all(6),
        width: double.infinity,
        decoration: BoxDecoration(
          color: _isFavorite ? accentColor : primaryColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: accentColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              size: widget.iconSize,
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? primaryColor : accentColor,
            ),
            const SizedBox(width: 4),
            Text(
              'Favorite',
              style: bodyBold.copyWith(color: _isFavorite ? primaryColor : accentColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
