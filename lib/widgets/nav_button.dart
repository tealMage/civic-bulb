import 'package:flutter/material.dart';
import 'dart:html' as html;

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

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

  const NavButton(
      {Key key,
      @required this.text,
      @required this.onPressed,
      this.color = const Color.fromRGBO(250, 91, 61, 1)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      child: Text(text, style: TextStyle(fontWeight: FontWeight.w700)),
      borderSide: BorderSide(
        color: color,
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,
    );
  }
}

class SocialButton extends StatelessWidget {
  final image;
  final onPressed;

  const SocialButton({Key key, @required this.image, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onPressed,
      child: Container(
              height: 90,
              width: 90,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage(image),
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                ),
              ),
            ),
    );
  }
}