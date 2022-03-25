import 'package:flutter/material.dart';
import 'package:virtualtnpscexam/quizmodel.dart';
import 'package:virtualtnpscexam/result.dart';

class Quizpage extends StatefulWidget {
  final List<Quizmodel> que;

  const Quizpage({Key? key, required this.que}) : super(key: key);
  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int index = 0;
  int score = 0;
  bool isanswerable = true;

  void answered(pos) {
    if (widget.que[index].answer[pos] == widget.que[index].correctanswer) {
      //correct answer
      setState(() {
        score += 1;
      });
    }

    if (widget.que.length - 1 == index) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Resultpage(
                  que: widget.que,
                  correctanswers: score,
                )),
      );
    } else {
      setState(() {
        index += 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Text(
            "questions : " + "${index + 1}" + "/" + "${widget.que.length}",
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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: Card(
                  child: Center(child: Text(widget.que[index].question)),
                ),
              ),
              Divider(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    answered(0);
                  },
                  child: Card(
                    child: Center(child: Text(widget.que[index].answer[0])),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    answered(1);
                  },
                  child: Card(
                    child: Center(child: Text(widget.que[index].answer[1])),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    answered(2);
                  },
                  child: Card(
                    child: Center(child: Text(widget.que[index].answer[2])),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 10,
                margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
                child: GestureDetector(
                  onTap: () {
                    answered(3);
                  },
                  child: Card(
                    child: Center(child: Text(widget.que[index].answer[3])),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
