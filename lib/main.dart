import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text("virtual tnpsc exam"),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Card(
                  child: Center(
                    child: Text(
                      "quick quiz",
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Card(
                  child: Center(
                    child: Text(
                      "daily quiz",
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                child: Card(
                  child: Center(
                    child: Text(
                      "model exam",
                      style: TextStyle(fontSize: 20, color: Colors.deepOrange),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
