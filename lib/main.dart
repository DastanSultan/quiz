import 'package:flutter/material.dart';
import 'package:quiz/quizModel.dart';

void main() {
  runApp(MyDev());
}

class MyDev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: myApp(),
    );
  }
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  String theme = "Meine Favoratuiom";
  sied(String menu) {
    theme = menu;
  }

  Widget col() {
    return InkWell(
        onTap: () {
          setState(() {
            index = 0;
            richtigAntwort = 0;
            icons.clear();
          });
        },
        child: Column(
          children: [
            if (richtigAntwort == 9)
              Text(
                "Правильные ответы $richtigAntwort",
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
            if (richtigAntwort < 0)
              Text(
                "Правильные ответы $richtigAntwort",
                style: TextStyle(color: Colors.white, fontSize: 27),
              ),
            Text(
              "Правильные ответы $richtigAntwort",
              style: TextStyle(color: Colors.white, fontSize: 27),
            ),
          ],
        ));
  }

  int richtigAntwort = 0;
  int index = 0;
  TextStyle colorsWhite = TextStyle(color: Colors.white, fontSize: 25);
  List<Widget> icons = [];
  List<quizModel> surooJoop = [
    quizModel(suroo: "Жер тоголок эмес?", joop: true),
    quizModel(suroo: "Адольф Гитлер немец?", joop: false),
    quizModel(suroo: "КР тунгуч президенти К.Бакиев?", joop: false),
    quizModel(suroo: "Apple компаниясын Билл Гейтс негиздеген?", joop: false),
  ];
  addAnswer(bool userWahl) {
    final bizdin = surooJoop[index].joop;
    if (userWahl == bizdin) {
      icons.add(
        Icon(
          Icons.check,
          color: Colors.green,
          size: 40,
        ),
      );
      richtigAntwort++;
    } else if (userWahl != bizdin) {
      icons.add(
        Icon(
          Icons.cancel,
          color: Colors.red,
          size: 25,
        ),
      );
    }

    setState(() {
      index++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Dastan")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: index < surooJoop.length
                ? [
                    Text("xcasd"),
                    Center(
                      child: Text(
                        // "Суроолор",
                        surooJoop[index].suroo!,
                        style: colorsWhite,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          addAnswer(true);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Туура",
                          style: colorsWhite,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          addAnswer(false);
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Туура эмес",
                          style: colorsWhite,
                        ),
                      ),
                    ),
                    Row(
                      children: icons,
                    ),
                  ]
                : [
                    col(),
                    Row(
                      children: icons,
                    )
                  ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("$theme"),
              onTap: () {
                setState(() {
                  sied("Sultankulov");
                });
                Navigator.pop(context);
              },
            ),
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ),
            ),
          ],
        ),
      ),
    );
  }
}
