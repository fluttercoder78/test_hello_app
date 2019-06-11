import 'package:flutter/material.dart';
import 'dart:math';
import 'calculator.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Hello",
            theme: ThemeData(
                primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: "Hello"),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key key, this.title}) : super(key: key);
    final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    Color _backgroundColor = Colors.white;
    void _colorChange()
    {
        setState(() {
            int min = 0;
            int max = 0xFFFFFFFF;
            Random random = new Random();
            int randomValue = min + random.nextInt(max - min);
            _backgroundColor = Color(randomValue);
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
             appBar: AppBar(
                 title: Text(widget.title),
                 actions: <Widget>[
                     FlatButton(
                         textColor: Colors.white,
                         onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator()));
                         },
                         child: Text("Calculator"),
                         shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                     ),
                 ],
             ),
             body: GestureDetector(
                 onTap: () {
                     _colorChange();
                     print("onTap called. Color $_backgroundColor"); // log
                 },
                 child: Container(
                     height: MediaQuery.of(context).size.height,
                     width: MediaQuery.of(context).size.width,
                     child:Center (
                         child: Text("Hey there", style: Theme.of(context).textTheme.display1,),
                     ),
                     color: _backgroundColor,
                 ),
             ),
        );
    }
}
