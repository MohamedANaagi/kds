import 'package:flutter/material.dart';

import '../constant/Colors/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String text;
  final List<Widget> menuItems;
  final bool isallorder;
  final VoidCallback? onTap;

  const CustomIconButton({
    required this.text,
    required this.menuItems,
    this.onTap,
    Key? key,
    required this.isallorder,
  }) : super(key: key);

  void _showCustomDialog(BuildContext context, Offset offset) {
    if (onTap != null) {
      onTap!();
      return;
    }
    showDialog(
      context: context,
      barrierColor: Colors.transparent, // Makes the background transparent
      builder: (BuildContext dialogContext) {
        return Stack(
          children: [
            Positioned(
              left: isallorder
                  ? offset.dx - 100
                  : offset.dx - MediaQuery.of(context).size.width * 0.2,
              top: offset.dy, // Place dialog directly under the button
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: isallorder
                      ? MediaQuery.of(context).size.width * 0.25
                      : MediaQuery.of(context).size.width * 0.6,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: menuItems,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (TapDownDetails details) {
        _showCustomDialog(context, details.globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.x,
          ),
          height: MediaQuery.of(context).size.height * 0.16,
          width: 170,
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
