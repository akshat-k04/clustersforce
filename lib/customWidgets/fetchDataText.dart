import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fetchText extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(

      style: const TextStyle(
          decoration: TextDecoration.none ,
          fontSize: 12,
          color: Colors.black
      ),
      child: AnimatedTextKit(
        repeatForever: true,
        pause: Duration(seconds: 2),
        animatedTexts: [
          TypewriterAnimatedText('Fetching data!',speed: Duration(milliseconds: 100)),
        ],

      ),
    );
  }

}