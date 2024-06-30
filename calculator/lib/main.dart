import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorHomePage(),
    );
  }
}

class CalculatorHomePage extends StatefulWidget {
  @override
  _CalculatorHomePageState createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "0";
  String _output = "0";
  String operand = "";
  double num1 = 0;
  double num2 = 0;

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (!_output.contains(".")) {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      switch (operand) {
        case "+":
          _output = (num1 + num2).toString();
          break;
        case "-":
          _output = (num1 - num2).toString();
          break;
        case "*":
          _output = (num1 * num2).toString();
          break;
        case "/":
          _output = (num1 / num2).toString();
          break;
        default:
          break;
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildButton(String buttonText, {Color? buttonColor, Color? textColor}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor ?? Color.fromARGB(255, 211, 211, 211),  // Default light gray button background
          foregroundColor: textColor ?? Colors.blue,  // Default blue button text
          padding: EdgeInsets.all(19.0),  // Reduced padding to make buttons smaller
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),  // Increased font size
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 20, 20, 20),  // Black header color
      ),
      body: Container(
        color: Color.fromARGB(255, 20, 20, 20),  // Dark gray background color
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 60.0,
                horizontal: 12.0,
              ),
              child: Text(
                output,
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,  // Displayed text color
                ),
              ),
            ),
            Expanded(
              child: Divider(color: Color.fromARGB(255, 1, 146, 131)),
            ),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("7", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("8", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("9", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("/", buttonColor: Colors.white, textColor: Color.fromARGB(255, 1, 146, 131)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("4", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("5", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("6", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("*", buttonColor: Colors.white, textColor: Color.fromARGB(255, 1, 146, 131)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("1", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("2", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("3", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("-", buttonColor: Colors.white, textColor: Color.fromARGB(255, 1, 146, 131)),
                  ],
                ),
                Row(
                  children: [
                    buildButton(".", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("0", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("00", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Color.fromARGB(255, 1, 146, 131)),
                    buildButton("+", buttonColor: Colors.white, textColor: Color.fromARGB(255, 1, 146, 131)),
                  ],
                ),
                Row(
                  children: [
                    buildButton("C", buttonColor: Color.fromARGB(255, 0, 0, 0), textColor: Colors.white),
                    buildButton("=", buttonColor: Color.fromARGB(255, 1, 146, 131), textColor: Colors.white),  // Different color for "=" button
                  ],
                ),
              ],
            )
          ],
        ),
     ),
);
}
}