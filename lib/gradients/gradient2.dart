import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

void main() => runApp(Gradient2());

class Gradient2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Flutter'),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              /// STOPS IS USED TO CONTROL HOW MUCH THEY TAKE UP
              stops: [
                0.1,
                0.4,
              ],
              colors: [
                Colors.blueAccent,
                Colors.blueGrey,
              ])),

        body: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    /// STOPS IS USED TO CONTROL HOW MUCH THEY TAKE UP
                    stops: [
                      0.1,
                      0.4,
                      0.6,
                      0.9
                    ],
                    colors: [
                      Colors.yellow,
                      Colors.blue,
                      Colors.white,
                      Colors.teal
                    ]
                  )
              ),
            child: Center(
              child: Text(
                'Hello Gradient!',
                style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            )
        )
    );
  }
}