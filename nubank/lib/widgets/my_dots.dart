import 'package:flutter/material.dart';

class MyDots extends StatelessWidget {
  final int currentIndex;
  final double top;
  final bool showMenu;

  Color handleColor(int index) => index == currentIndex ? Colors.white : Colors.white38;

  const MyDots({Key key, this.currentIndex, this.top, this.showMenu}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 0 : 1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AnimatedContainer(
              height: 7,
              width: 7,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: handleColor(0),
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 8),
            AnimatedContainer(
              height: 7,
              width: 7,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: handleColor(1),
                shape: BoxShape.circle
              ),
            ),
            SizedBox(width: 8),
            AnimatedContainer(
              height: 7,
              width: 7,
              duration: Duration(milliseconds: 300),
              decoration: BoxDecoration(
                color: handleColor(2),
                shape: BoxShape.circle
              ),
            ),
          ]
        ),
      ),
    );
  }
}