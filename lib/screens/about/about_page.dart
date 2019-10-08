import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:civic_bulb/utils/responsive_layout.dart';
import 'package:civic_bulb/widgets/header.dart';
import 'package:civic_bulb/widgets/footer.dart';
import 'package:civic_bulb/widgets/nav_button.dart';
import 'package:civic_bulb/bloc/home/home_bloc.dart';
import 'package:provider/provider.dart';
import 'package:civic_bulb/route.dart';

class AboutPage extends StatelessWidget {
  static Route<dynamic> routeAnim() {
    return FadeRoute(
      name: '/about',
      title: 'About',
      builder: (_) => AboutPage(),
    );
  }
  static Route<dynamic> route() {
    return SimpleRoute(
      name: '/about',
      title: 'About',
      builder: (_) => AboutPage(),
    );
  }

  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloc>(
      builder: (context) => HomeBloc(),
      dispose: (context, value) => value.dispose(),
      child: ResponsiveLayout(
        largeScreen: Scaffold(
          backgroundColor: Color.fromRGBO(211, 211, 211, 1),
          body: SingleChildScrollView(
            child: ResponsiveLayout(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Header(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Text("about"),
                  Placeholder(fallbackHeight: 120,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                  ),
                  Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
