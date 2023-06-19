import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/themes/app_icons.dart';

class LabelAppBar extends AppBar {
  final bool showBackButton;
  final List<Widget>? valueActions;
  final String? valueTitle;
  final bool hasBackgroud;

  final void Function()? onBackPressed;
  LabelAppBar({
    super.key,
    this.showBackButton = false,
    this.valueActions,
    this.valueTitle,
    this.hasBackgroud = true,
    this.onBackPressed,
    required BuildContext context,
    bool centerTitle = true,
  }) : super(
          title: hasBackgroud ? Text(valueTitle ?? 'POKÉFUN', style: appbarTitle) : null,
          centerTitle: centerTitle,
          backgroundColor: hasBackgroud ? accentColor.withOpacity(0.90) : Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            ...valueActions ?? [],
          ],
          leading: showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: hasBackgroud ? Colors.white : Colors.black,
                  onPressed: () {
                    if (onBackPressed != null) {
                      onBackPressed();
                    } else {
                      GoRouter.of(context).pop();
                    }
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: kIsWeb
                      ? Image.asset(
                          AppIcons.pokefunLogoImage,
                        )
                      : SvgPicture.asset(
                          AppIcons.pokefunLogo,
                        ),
                ),
        );
}
