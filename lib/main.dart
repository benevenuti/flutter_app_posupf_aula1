import 'package:flutter/material.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> chipsState = [false, false, false, false, false, false];
  List<String> chipsLabels = [
    "Android Nativo",
    "iOS Nativo",
    "Flutter",
    "React Native",
    "PWA",
    "Ionic"
  ];
  List<String> itemsDescriptions = [
    "Linguagem C, Java e Kotlin",
    "Linguagem Objective-C e Swift",
    "Linguagem DART",
    "Linguagem JavaScript e TypeScript",
    "Linguagem JavaScript e TypeScript",
    "Linguagem JavaScript e TypeScript",
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Minhas linguagens"),
          ),
          body: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: buildChips(),
                  )),
              Expanded(
                child: ListView(
                  children: buildListView(),
                ),
              )
            ],
          )),
    );
  }

  List<Widget> buildChips() {
    List<Widget> res = [];
    for (int index = 0; index < chipsLabels.length; index++) {
      res.add(buildChoiceChip(index));
    }
    return res;
  }

  Widget buildChoiceChip(int index) {
    return ChoiceChip(
      label: Text(chipsLabels[index]),
      selected: chipsState[index],
      onSelected: (checked) {
        setState(() {
          chipsState[index] = checked;
        });
      },
    );
  }

  List<Widget> buildListView() {
    List<Widget> res = [];
    for (int index = 0; index < chipsLabels.length; index++) {
      if (chipsState[index]) {
        res.add(buildItemList(index));
      }
    }
    return res;
  }

  Widget buildItemList(int index) {
    return Card(
      child: ListTile(
        title: Text(chipsLabels[index]),
        subtitle: Text(itemsDescriptions[index]),
        leading: Icon(Icons.add_box),
      ),
    );
  }
}
