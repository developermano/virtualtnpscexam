import 'package:flutter/material.dart';

class Quizpage extends StatefulWidget {
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Text(
            "questions : " + "2/10",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            children: [
              quizcard(context),
              Divider(
                height: MediaQuery.of(context).size.height / 10,
              ),
              quizcard(context),
              quizcard(context),
              quizcard(context),
              quizcard(context),
            ],
          ),
        ));
  }
}

Widget quizcard(context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height / 10,
    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
    child: Card(
      child: Center(child: Text("what is your name? ")),
    ),
  );
}
