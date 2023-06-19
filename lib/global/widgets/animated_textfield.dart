import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/global/utils/quick_border.dart';

class AnimatedTextField extends StatefulWidget {
  double iconSize;
  TextEditingController controller;
  Function onTap;
  double width;

  AnimatedTextField({super.key, required this.onTap, required this.controller, this.iconSize = 24.0, this.width = 50});

  @override
  State<AnimatedTextField> createState() => _AnimatedTextFieldState();
}

class _AnimatedTextFieldState extends State<AnimatedTextField> {
  final ValueNotifier<FocusNode> _focusNode = ValueNotifier<FocusNode>(FocusNode());

  @override
  void initState() {
    _focusNode.value.addListener(() {
      if (_focusNode.value.hasFocus) {
        setState(() {
          widget.width = 140;
        });
      } else {
        setState(() {
          widget.width = 50;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _focusNode,
      builder: (context, value, child) {
        return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            width: widget.width,
            // padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: value.hasFocus ? primaryColor : null,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      focusNode: value,
                      style: TextStyle(
                        fontSize: 18,
                        color: value.hasFocus ? Colors.black : Colors.transparent,
                      ),
                      decoration: InputDecoration(
                        isDense: true,
                        isCollapsed: value.hasFocus,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Search',
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Icon(
                      Icons.search,
                      color: value.hasFocus ? accentColor : Colors.white,
                      size: widget.iconSize,
                    ),
                    onTap: () {
                      if (!value.hasFocus) {
                        value.requestFocus();
                      } else {
                        widget.onTap();
                      }
                    },
                  )
                ],
              ),
            ));
      },
    );
  }
}
