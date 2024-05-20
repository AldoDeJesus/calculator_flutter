import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyect_01/widgets/CalcButton.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _history = '';
  String _expression = '';
  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

    void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void calculate (String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }
void numberClick(String text) {
    setState(() {
      _expression += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculator",
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: const Alignment(1.0, 1.0),
                  child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 14.0),
                    ),
                  ),
                ),
                ),
                Container(
                  alignment: const Alignment(1.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: (
                      Text(_expression
                      ,style: GoogleFonts.rubik(
                        textStyle: const TextStyle(color: Colors.white, fontSize:48.0),
                      ), 
                      )
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Calcbutton(
                      bgColor: 0xFF9E9E9E,
                      text: "AC",
                      textColor: 0xFF000000,
                      callback: allClear,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      bgColor: 0xFF9E9E9E,
                      text: "C",
                      textColor: 0xFF000000,
                      callback: clear,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      bgColor: 0xFF9E9E9E,
                      text: "%",
                      textColor: 0xFF000000,
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      bgColor: 0xFFFF8F00,
                      text: "/",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Calcbutton(
                      text: "7",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "8",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "9",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "*",
                      bgColor: 0xFFFF8F00,
                      callback: numberClick,
                      textSize: 20.0
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Calcbutton(
                      text: "4",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "5",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "6",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "-",
                       bgColor: 0xFFFF8F00,
                      callback: numberClick,
                      textSize: 20.0
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Calcbutton(
                      text: "3",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "2",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "1",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "+",
                      bgColor: 0xFFFF8F00,
                      callback: numberClick,
                      textSize: 20.0
                    ),
                  ],
                ),

                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Calcbutton(
                      text: ".",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "0",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "00",
                      callback: numberClick,
                      textSize: 20.0
                    ),
                    Calcbutton(
                      text: "=",
                      bgColor: 0xFFFF8F00,
                      callback:calculate ,
                      textSize: 20.0
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
