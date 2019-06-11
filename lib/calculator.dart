import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return CalculatorPage(title: "Simple calculator");
    }
}

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _CalculatorState createState() => new _CalculatorState();
}

class _CalculatorState extends State<CalculatorPage> {
    String output = "0";
    String _output = "0";
    int number1 = 0;
    int number2 = 0;
    String operand = "";
    bool variableEqualState = false;

    void buttonPressed(String buttonText){
        if(buttonText == "C"){
            _output = "0";
            number1 = 0;
            number2 = 0;
            operand = "";
        } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){
            number1 = int.parse(output);
            operand = buttonText;
            _output = "0";
        } else if (buttonText == "="){
            number2 = int.parse(output);
            if(operand == "+"){
                _output = (number1 + number2).toString();
            }
            if(operand == "-"){
                _output = (number1 - number2).toString();
            }
            if(operand == "X"){
                _output = (number1 * number2).toString();
            }
            if(operand == "/"){
                if (number2 == 0){
                    _output ="ERROR";
                }else{
                    _output = (number1 / number2).round().toString();
                }
            }
            number1 = 0;
            number2 = 0;
            operand = "";
            variableEqualState = true;
        } else {
            if (variableEqualState == false){
                if (_output.length > 14){
                    _output = _output;
                }else{
                    _output = _output + buttonText;
                }
            } else{
                _output = buttonText;
                variableEqualState = false;
            }
        }
        print(_output); // log
        setState(() {
            if (_output == "ERROR"){
                output = _output;
            }else{
                output = int.parse(_output).toString();
            }
        });
    }

    Widget buildButton(String buttonText) {
        return new Expanded(
            child: new OutlineButton(
                padding: new EdgeInsets.all(24.0),
                child: new Text(buttonText,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                ),
                onPressed: () {
                    buttonPressed(buttonText);
                },
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
            ),
        );
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: AppBar(
                title: Text("Simple calculator"),
                actions: <Widget>[
                    FlatButton(
                        textColor: Colors.white,
                        onPressed: () {
                            Navigator.pop(context);
                        },
                        child: Text('Go to "Hello"'),
                        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                    ),
                ],
            ),
            body: new Container(
                child: new Column(
                    children: <Widget>[
                        new Container(
                            alignment: Alignment.centerRight,
                            padding: new EdgeInsets.symmetric(
                                vertical: 24.0,
                                horizontal: 12.0
                            ),
                            child: new Text(output,
                                style: new TextStyle(
                                    fontSize: 48.0,
                                    fontWeight: FontWeight.bold,
                                )
                            )
                        ),
                        new Expanded(
                            child: new Divider(),
                        ),
                        new Column(children: [
                             new Row(children: [
                                 buildButton("7"),
                                 buildButton("8"),
                                 buildButton("9"),
                                 buildButton("+")
                             ]),
                             new Row(children: [
                                 buildButton("4"),
                                 buildButton("5"),
                                 buildButton("6"),
                                 buildButton("-")
                             ]),
                             new Row(children: [
                                 buildButton("1"),
                                 buildButton("2"),
                                 buildButton("3"),
                                 buildButton("X")
                             ]),
                             new Row(children: [
                                 buildButton("0"),
                                 buildButton("C"),
                                 buildButton("/"),
                                 buildButton("="),
                             ]),
                        ])
                    ],
                )
            )
        );
    }
}