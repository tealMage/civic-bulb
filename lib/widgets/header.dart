

import 'package:civic_bulb/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:civic_bulb/screens/home/home_page.dart';
import 'dart:html' as html;
import 'package:civic_bulb/widgets/nav_button.dart';
class Header extends StatelessWidget {

  const Header({Key key}) : super(key: key);

  List<Widget> navButtons() => [
         SizedBox(height: 20,),
        SocialButton(
          image: "assets/images/octocat.png",
          onPressed: () {
            html.window.open("https://github.com/tealMage", "Git");
          },
        ), 
        SizedBox(width: 20,),
        SocialButton(
          image: "assets/images/linkedinLogo.png",
          onPressed: () {
            html.window.open("https://www.linkedin.com/in/adam-sterrett-69427922", "Linked in");
          },
        ), 
        SizedBox(width: 20,),
        SocialButton(
          image: "assets/images/twitterLogo.png",
          onPressed: () {
            html.window.open("https://twitter.com/tealmage", "Twitter");
          },
        )
      ];

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
                      children: navButtons(),
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


