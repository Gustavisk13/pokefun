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
          widget.width = 200;
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
            color: value.hasFocus ? primaryColor : primaryColor,
            borderRadius: BorderRadius.circular(14),
          ),
          child: value.hasFocus
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: widget.controller,
                          focusNode: value,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Icon(
                          Icons.search,
                          size: widget.iconSize,
                        ),
                        onTap: () => widget.onTap(),
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8),
                  child: GestureDetector(
                    child: Icon(
                      Icons.search,
                      size: widget.iconSize,
                    ),
                    onTap: () {
                      FocusScope.of(context).requestFocus(value);
                    },
                  ),
                ),
        );
      },
    );
  }
}
