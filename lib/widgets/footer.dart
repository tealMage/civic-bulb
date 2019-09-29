import 'dart:html' as html;

import 'package:civic_bulb/utils/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:civic_bulb/widgets/nav_button.dart';
import 'package:civic_bulb/screens/about/about_page.dart';
import 'package:civic_bulb/screens/contact/contact_page.dart';

class Footer extends StatelessWidget {
  List<Widget> navWidgets(BuildContext context) {
    return [
      NavButton(
        text: "about",
        onPressed: () {
          Navigator.of(context).pushReplacement(AboutPage.routeAnim());
        },
      ),
      NavButton(
        text: "contact us",
        onPressed: () {
          Navigator.of(context).pushReplacement(ContactPage.routeAnim());
        },
      ),
    ];
  }

  Widget copyRightText() => Text(
        "Civic Bulb",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: const Color.fromRGBO(250, 91, 61, 1),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .1),
      child: ResponsiveLayout(
        largeScreen: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: navWidgets(context),
            ),
            copyRightText(),
          ],
        ),
        smallScreen: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ...navWidgets(context),
            copyRightText(),
            SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
