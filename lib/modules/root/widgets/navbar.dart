import 'package:flutter/material.dart';
import 'package:pokefun/global/themes/app_themes.dart';
import 'package:pokefun/modules/root/widgets/root_navigation_bar_item.dart';

class Navbar extends StatefulWidget {
  final List<RootNavigationTabItem>? items;
  final int? currentIndex;
  final void Function(int val)? onTap;
  final Color? selectedBackgroundColor;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color? backgroundColor;
  final double? fontSize;
  final double? iconSize;
  final double? itemBorderRadius;
  final double? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final double width;
  final double height;
  final double? elevation;

  Navbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor = Colors.black,
    this.selectedBackgroundColor = Colors.white,
    this.selectedItemColor = Colors.black,
    this.iconSize = 24.0,
    this.fontSize = 11.0,
    this.borderRadius = 8,
    this.itemBorderRadius = 8,
    this.unselectedItemColor = Colors.white,
    this.margin = const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
    this.padding = const EdgeInsets.only(bottom: 8, top: 8),
    this.width = double.infinity,
    this.height = 110,
    this.elevation = 0.0,
  });

  @override
  _FloatingNavbarState createState() => _FloatingNavbarState();
}

class _FloatingNavbarState extends State<Navbar> {
  List<RootNavigationTabItem> get items => widget.items!;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      elevation: widget.elevation,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: widget.margin!,
            child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(widget.borderRadius!),
                color: widget.backgroundColor,
              ),
              // width: widget.width,
              height: widget.height,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 10), // Espaçamento horizontal entre os itens
                itemCount: items.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _tabItem(context, items[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabItem(BuildContext context, RootNavigationTabItem item) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
          color: widget.currentIndex == items.indexOf(item) ? widget.selectedBackgroundColor : primaryColor,
          borderRadius: BorderRadius.circular(widget.itemBorderRadius!)),
      child: InkWell(
        onTap: () {
          widget.onTap!(items.indexOf(item));
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width:
              widget.width.isFinite ? (widget.width / items.length - 8) : MediaQuery.of(context).size.width / items.length - 24,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: item.title != null ? 4 : 8),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                item.icon,
                color: widget.currentIndex == items.indexOf(item) ? widget.selectedItemColor : widget.unselectedItemColor,
                size: widget.iconSize,
              ),
              if (item.title != null)
                Text(
                  '${item.title}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: widget.currentIndex == items.indexOf(item) ? widget.selectedItemColor : widget.unselectedItemColor,
                    fontSize: widget.fontSize,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
