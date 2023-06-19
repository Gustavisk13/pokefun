import 'package:flutter/material.dart';
import 'package:pokefun/global/themes/app_icons.dart';
import 'package:pokefun/global/themes/app_themes.dart';

class NotFoundPage extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final bool actionButton;
  final Function()? onTap;

  const NotFoundPage({
    Key? key,
    required this.title,
    this.buttonTitle = '',
    this.actionButton = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppIcons.notFound,
          width: 200,
          height: 200,
        ),
        const SizedBox(height: 16),
        Text(
          title,
          style: headlineBoldLarge.copyWith(color: Colors.black),
        ),
        if (actionButton) ...[
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => onTap,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                buttonTitle,
                style: bodyBold.copyWith(color: primaryColor, fontSize: 18),
              ),
            ),
          ),
        ]
      ],
    );
  }
}
