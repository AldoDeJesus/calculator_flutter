import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Calcbutton extends StatelessWidget {
    final Function callback;
    final String text;
    final double textSize;
    final int bgColor;
    final int textColor;
  const Calcbutton({super.key,
  required this.callback,
  required this.text,
  this.textSize=28.00,
  this.textColor=0xFFFFFFFF,
  this.bgColor=0xFF424242});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: TextButton(
          onPressed: () {callback(text);},
          style: TextButton.styleFrom(
            backgroundColor: Color(bgColor),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20.0),
          ),
          child: Text(
            text,
            style: GoogleFonts.rubik(textStyle:TextStyle(fontSize: textSize),),
            ),
      ),
      ),
    );
  }
}