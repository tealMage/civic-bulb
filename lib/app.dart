import 'package:flutter/material.dart';
import 'package:civic_bulb/screens/home/home_page.dart';
import 'package:civic_bulb/screens/contact/contact_page.dart';
import 'package:civic_bulb/screens/about/about_page.dart';


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateRoute: (settings) {
        switch(settings.name) {
          case "/": return HomePage.route();
          case "/contact": return ContactPage.route();
          case "/about": return AboutPage.route();
          default: return HomePage.route();
        }
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
