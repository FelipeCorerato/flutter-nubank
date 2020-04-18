import 'package:flutter/material.dart';
import 'package:nubank/widgets/my_app_bar.dart';
import 'package:nubank/widgets/my_dots.dart';
import 'package:nubank/widgets/my_menu.dart';
import 'package:nubank/widgets/my_page_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showMenu;
  int _currentIndex;
  double _yPosition;

  @override
  void initState() {
    super.initState();
    _showMenu = false;
    _currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double _screenHeight = MediaQuery.of(context).size.height;
    if (_yPosition == null) {
      _yPosition = _screenHeight * .24;
    }

    return Scaffold(
      backgroundColor: Colors.purple[800],
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          MyAppBar(
            showMenu: _showMenu,
            onTap: () => setState(() { 
              _showMenu = !_showMenu;
              _yPosition = _showMenu ? _screenHeight * .75 : _screenHeight * .24;
            })
          ),
          MyMenu(
            top: _screenHeight * .20,
            showMenu: _showMenu,
          ),
          MyPageView(
            top: _yPosition, // !_showMenu ? _screenHeight * .24 : _screenHeight * .75,
            showMenu: _showMenu,
            onChanged: (index) => setState(() => _currentIndex = index),
            onPanUpdate: (details) {
              double topLimit = _screenHeight * .24;
              double bottomLimit = _screenHeight * .75;
              double middlePosition = (bottomLimit - topLimit) / 2;

              setState(() {
                _yPosition += details.delta.dy;

                _yPosition = _yPosition < topLimit ? topLimit : _yPosition;
                _yPosition = _yPosition > bottomLimit ? bottomLimit : _yPosition;

                if (_yPosition != bottomLimit && details.delta.dy > 0)
                  _yPosition = _yPosition > topLimit + middlePosition - 50 ? bottomLimit : _yPosition;

                if (_yPosition != topLimit && details.delta.dy < 0)
                  _yPosition = _yPosition < bottomLimit - middlePosition ? topLimit : _yPosition;

                if (_yPosition == bottomLimit) {
                  _showMenu = true;
                } else if (_yPosition == topLimit) {
                  _showMenu = false;
                }
              });
            }
          ),
          MyDots(
            currentIndex: _currentIndex,
            top: _screenHeight * .70,
            showMenu: _showMenu,
          ),
        ],
      ),
    );
  }
}