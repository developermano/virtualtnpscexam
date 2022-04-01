import 'package:flutter/material.dart';
import 'package:virtualtnpscexam/main.dart';
import 'package:virtualtnpscexam/quizmodel.dart';

class Resultpage extends StatefulWidget {
  final List<Quizmodel> que;
  final int correctanswers;

  const Resultpage({Key? key, required this.que, required this.correctanswers})
      : super(key: key);

  @override
  _ResultpageState createState() => _ResultpageState();
}

class _ResultpageState extends State<Resultpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
          child: Card(
            child: Column(
              children: [
                ListTile(
                  title: Text("score:"),
                  trailing: Text("${widget.correctanswers * 10}"),
                ),
                ListTile(
                  title: Text("total questions:"),
                  trailing: Text(widget.que.length.toString()),
                ),
                ListTile(
                  title: Text("correct answers:"),
                  trailing: Text("${widget.correctanswers}"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: Text("home")),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text("it is under construction"),
                                );
                              });
                        },
                        child: Text("check leaderboard")),
                    ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: MediaQuery.of(context).size.height,
                                  child: ListView.builder(
                                      itemCount: widget.que.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          title:
                                              Text(widget.que[index].question),
                                          subtitle: Text(
                                              widget.que[index].correctanswer),
                                        );
                                      }),
                                );
                              });
                        },
                        child: Text("show answers")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
