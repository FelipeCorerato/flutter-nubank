import 'package:flutter/material.dart';
import 'package:nubank/widgets/menu_item.dart';

class MyMenu extends StatelessWidget {
  final double top;
  final bool showMenu;

  const MyMenu({Key key, this.top, this.showMenu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: 0,
      right: 0,
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: showMenu ? 1 : 0,
        child: Container(
          height: MediaQuery.of(context).size.height * .55,
          child: Column(
            children: <Widget>[
              Image.network('https://webmobtuts.com/wp-content/uploads/2019/02/QR_code_for_mobile_English_Wikipedia.svg_.png',
                height: 100,
                color: Colors.white,
              ),
              Text.rich(
                TextSpan(
                  text: 'Banco ',
                  children: [
                    TextSpan(
                      text: '260 - Nu Pagamentos S.A', 
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ]
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5),
              Text.rich(
                TextSpan(
                  text: 'Agência ',
                  children: [
                    TextSpan(
                      text: '0001', 
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ]
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 5),
              Text.rich(
                TextSpan(
                  text: 'Conta ',
                  children: [
                    TextSpan(
                      text: '0000000-0', 
                      style: TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ]
                ),
                style: TextStyle(fontSize: 12),
              ),
              SizedBox(height: 25),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      MenuItem(
                        icon: Icons.info_outline,
                        text: 'Me ajuda'
                      ),
                      MenuItem(
                        icon: Icons.person_outline,
                        text: 'Perfil'
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        text: 'Configurar conta'
                      ),
                      MenuItem(
                        icon: Icons.credit_card,
                        text: 'Configurar cartão'
                      ),
                      MenuItem(
                        icon: Icons.store,
                        text: 'Pedir conta PJ'
                      ),
                      MenuItem(
                        /////////////////////////////// fazer distinção de plataforma
                        icon: Icons.phone_android,
                        text: 'Configurações do app'
                      ),
                      SizedBox(height: 25),
                      Container(
                        height: 35,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: .7, color: Colors.white54)
                        ),
                        child: RaisedButton(
                          color: Colors.purple[800],
                          highlightColor: Colors.transparent,
                          elevation: 0,
                          disabledElevation: 0,
                          focusElevation: 0,
                          highlightElevation: 0,
                          hoverElevation: 0,
                          splashColor: Colors.purple[900],
                          child: Text('SAIR DO APP', style: TextStyle(fontSize: 10)),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}