import 'package:flutter/material.dart';

class Resultpage extends StatefulWidget {
  @override
  _ResultpageState createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text("score:"),
                trailing: Text("10"),   
              ),
              ListTile(
                title: Text("total questions:"),
                trailing: Text("10"),
              ),
              ListTile(
                title: Text("correct answers:"),
                trailing: Text("10"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: () {}, child: Text("retry")),
                  ElevatedButton(onPressed: () {}, child: Text("home")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
