import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/widgets/animated_textfield.dart';
import 'package:pokefun/global/widgets/favorite_button.dart';
import 'package:pokefun/global/widgets/label_app_bar.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: LabelAppBar(
          context: context,
          valueActions: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: AnimatedTextField(
            //     onTap: () {
            //       log('onTap');
            //     },
            //     controller: TextEditingController(),
            //   ),
            // ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    child: Text('App version 1.0.0'),
                  ),
                ];
              },
            )
          ],
        ),
        body: Center(child: FavoriteButton() /* Text('FavoritePage') */));
  }
}
