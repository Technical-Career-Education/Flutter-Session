import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Codecamp Day 1",
      home: ComponentDescription(),
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.red,
        buttonTheme: ButtonThemeData(buttonColor: Colors.blue, textTheme: ButtonTextTheme.accent),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;

  void incrementA() {
    setState(() {
      a++;
    });
  }

  void incrementB() {
    setState(() {
      b++;
    });
  }

  void incrementC() {
    setState(() {
      c++;
    });
  }

  void incrementD() {
    setState(() {
      d++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "$a",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "$b",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "$c",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "$d",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Column(
          children: [
            RaisedButton(
              onPressed: () {
                incrementA();
              },
              child: Text('Button 1'),
            ),
            RaisedButton(
              onPressed: () {
                incrementB();
              },
              child: Text('Button 2'),
            ),
            RaisedButton(
              onPressed: () {
                incrementC();
              },
              child: Text('Button 3'),
            ),
            RaisedButton(
              onPressed: () {
                incrementD();
              },
              child: Text('Button 4'),
            ),
          ],
        )
      ],
    ));
  }
}

class ComponentDescription extends StatefulWidget {
  @override
  _ComponentDescriptionState createState() => _ComponentDescriptionState();
}

class _ComponentDescriptionState extends State<ComponentDescription> {
  List<String> todoList = [];
  List<bool> isChecked = [];
  String textValue = "";

  void addItems({String todo}) {
    setState(() {
      todoList.add(todo);
      isChecked.add(false);
    });
  }

  void whenChecked({bool checked, int index}) {
    setState(() {
      isChecked[index] = checked;
    });
  }

  void deleteItems({int index}) {
    setState(() {
      todoList.removeAt(index);
      isChecked.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  width: 150,
                  height: 150,
                  child: TextField(
                    onChanged: (text) {
                      setState(() {
                        textValue = text;
                      });
                    },
                  ),
                ),
                actions: [
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      addItems(todo: textValue);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add Item',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
      ),
      appBar: AppBar(
        title: Text('Hello world'),
        leading: Icon(Icons.language),
        actions: [
          Icon(Icons.arrow_forward),
        ],
      ),
      body: Container(
          child: ListView.builder(
        itemCount: todoList.length, //[]   //only when index > 1
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              '${todoList[index]}',
              style: TextStyle(
                decoration: (isChecked[index]) ? TextDecoration.lineThrough : null,
              ),
            ), //["a","b","c"] => [0] => a
            leading: Checkbox(
              value: isChecked[index],
              onChanged: (value) {
                whenChecked(checked: value, index: index);
              },
            ),
            trailing: IconButton(
              onPressed: () {
                deleteItems(index: index);
              },
              icon: Icon(Icons.delete_outline),
            ),
          );
        },
      )),
    );
  }
}
