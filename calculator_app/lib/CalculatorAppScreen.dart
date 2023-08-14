import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
class CalculatorAppScreen extends StatefulWidget {
  @override
  _CalculatorAppScreenState createState() => _CalculatorAppScreenState();
}

class _CalculatorAppScreenState extends State<CalculatorAppScreen> {
  String input = '';
  String output = '';
  final Parser parser = Parser();
  final ContextModel contextModel = ContextModel();
  List<String> operands = [];
  List<String> operations = [];

  void _handleButtonClick(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        input = '';
        output = '';
        operands = [];
        operations = [];
      } else if (buttonText == '=') {
        try {
          operands.add(input);
          final Expression expression = _buildExpression();
          final double result = expression.evaluate(EvaluationType.REAL, contextModel);
          output = result.toString();
        } catch (e) {
          output = 'Error';
        }
        input = '';
        operands = [];
        operations = [];
      } else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/') {
        operands.add(input);
        input = '';
        operations.add(buttonText);
      } else {
        input += buttonText;
      }
    });
  }

  Expression _buildExpression() {
    if (operands.length != operations.length + 1) {
      throw Exception('Invalid expression');
    }

    Expression expression = parser.parse(operands[0]);
    for (int i = 0; i < operations.length; i++) {
      final Expression right = parser.parse(operands[i + 1]);
      if (operations[i] == '+') {
        expression = expression + right;
      } else if (operations[i] == '-') {
        expression = expression - right;
      } else if (operations[i] == '*') {
        expression = expression * right;
      } else if (operations[i] == '/') {
        expression = expression / right;
      }
    }

    return expression;
  }

  Widget _buildButton(String buttonText, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 80,
        width: 70,
        child: ElevatedButton(
          onPressed: () {
            _handleButtonClick(buttonText);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20),
            backgroundColor: color,
            textStyle: const TextStyle(fontSize: 25),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(buttonText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.bottomRight,
              child: Text(
                input,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ),
          const Divider(height: 2,color: Colors.lightBlue,),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(25),
              alignment: Alignment.bottomRight,
              child: Text(
                output,
                style:const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('/',color: Colors.lightBlueAccent),
            ],
          ),
          Row(
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('*',color: Colors.lightBlueAccent),
            ],
          ),
          Row(
            children:[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('-',color: Colors.lightBlueAccent),
            ],
          ),
          Row(
            children:[
              _buildButton('0'),
              _buildButton('C', color: Colors.grey[300]),
              _buildButton('=', color: Colors.blueGrey),
              _buildButton('+',color: Colors.lightBlueAccent),
            ],
          ),
        ],
      ),
    );
  }
}