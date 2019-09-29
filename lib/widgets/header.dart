

import 'package:civic_bulb/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:civic_bulb/screens/home/home_page.dart';

class Header extends StatelessWidget {
  final List<Widget> navButtons;

  const Header({Key key, this.navButtons}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.transparent,
      child: AnimatedPadding(
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width  * .1, right: MediaQuery.of(context).size.width  * .1, top: 20) ,
        duration: Duration(seconds: 1),
        child: ResponsiveLayout(
          largeScreen: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () => Navigator.of(context).pushReplacement(HomePage.routeAnim()),
                child: Container(
                height: 90,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    //Placeholder image
                    image: AssetImage("assets/images/bulbLogo.png"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
            ),
              ),
              Row(
                mainAxisAlignment: ResponsiveLayout.isSmallScreen(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    Row(
                      children: navButtons,
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


