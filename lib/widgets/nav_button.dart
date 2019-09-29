import 'package:flutter/material.dart';

class NavButton extends StatelessWidget {
  final text;
  final onPressed;
  final Color color;

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