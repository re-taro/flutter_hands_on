import 'package:flutter/material.dart';
import 'creat_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _todoItems = [
    "数学の課題",
    "TwitterのBotの実装",
    "A p e x L e g e n d s",
  ];

  void _addTodo(String title) {
    setState(() {
      _todoItems.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: _todoItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: Colors.purpleAccent),
              ),
              child: ListTile(
                title: Text(_todoItems[index]),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String title = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          _addTodo(title);
        },
        tooltip: 'Add ToDo',
        child: Icon(Icons.add),
      ),
    );
  }
}
