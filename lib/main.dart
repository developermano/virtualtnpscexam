import 'dart:convert';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:virtualtnpscexam/quizmodel.dart';
import 'package:virtualtnpscexam/result.dart';
import 'quizpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
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
  List<Quizmodel> quizdata = [];

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
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: const Text("virtual tnpsc exam"),
        ),
        body: Container(
          color: Colors.black,
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  AlertDialog s = AlertDialog(
                    title: Text("loading"),
                  );
                  showDialog(
                      context: context,
                      builder: (context) {
                        return s;
                      });
                  var url = Uri.parse(
                      'http://virtualtnpscexam.freevar.com/outputmain.php');
                  var response = await http.get(url, headers: {
                    "Accept": "application/json",
                    "Access-Control_Allow_Origin": "*"
                  });

                  Iterable jsonresult = json.decode(response.body);

                  quizdata = [];
                  //change to quizmodel
                  jsonresult.forEach((element) {
                    String ans = "";
                    switch (element['ans']) {
                      case "A":
                        ans = element['opt1'];
                        break;
                      case "B":
                        ans = element['opt2'];
                        break;
                      case "C":
                        ans = element['opt3'];
                        break;
                      case "D":
                        ans = element['opt4'];
                        break;
                      default:
                        ans = "";
                    }

                    quizdata.add(Quizmodel(
                        element['que'],
                        [
                          element['opt1'],
                          element['opt2'],
                          element['opt3'],
                          element['opt4'],
                        ],
                        ans));
                  });
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Quizpage(
                              que: quizdata,
                            )),
                  );
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Card(
                    child: Center(
                      child: Text(
                        "quick quiz",
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch("https://www.instagram.com/virtualtnpscexam/");
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Card(
                    child: Center(
                      child: Text(
                        "follow instagram and try quiz daily",
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  launch("https://t.me/virtualtnpscexam");
                },
                child: Container(
                  height: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: Card(
                    child: Center(
                      child: Text(
                        "join on telegram",
                        style:
                            TextStyle(fontSize: 20, color: Colors.deepOrange),
                      ),
                    ),
                  ),
                ),
              ),
              ad()
            ],
          ),
        ));
  }
}
