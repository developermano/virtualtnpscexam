import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
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
  late BannerAd myBanner;
  bool isloaded = false;

  //appid="ca-app-pub-6812988945725571~6079621755";
  //adid1="ca-app-pub-6812988945725571/7729451637";
  //adid2="ca-app-pub-6812988945725571/2992764739";
  //adid3="ca-app-pub-6812988945725571/1679683064";

  void initState() {
    super.initState();
    myBanner = BannerAd(
      adUnitId: "ca-app-pub-6812988945725571/7729451637",
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(onAdLoaded: (_) {
        setState(() {
          isloaded = true;
        });
      }, onAdFailedToLoad: (_, error) {
        print(error);
      }),
    );

    myBanner.load();
  }

  Widget ad() {
    if (isloaded == true) {
      return Container(
          alignment: Alignment.center,
          child: AdWidget(ad: myBanner),
          width: myBanner.size.width.toDouble(),
          height: myBanner.size.height.toDouble());
    } else {
      return Text('ad');
    }
  }

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
                ),
                Row(
                  children: [ad()],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
