import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokefun/global/themes/app_icons.dart';

class LoadingIndicator extends StatelessWidget {
  final double width;
  final double height;
  const LoadingIndicator({
    super.key,
    this.width = 50,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppIcons.pokeballLoading,
      width: width,
      height: height,
    );
  }
}
