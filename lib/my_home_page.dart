import 'package:flutter/material.dart';
import 'creat_page.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todoItems = [
    Todo("数学の課題", Icons.description),
    Todo("TwitterのBotの実装", Icons.description),
    Todo("A p e x L e g e n d s", Icons.description),
  ];

  void _addTodo(Todo todo) {
    setState(() {
      _todoItems.add(todo);
    });
  }

  void _deleteTodo(int index) {
    setState(() {
      _todoItems.removeAt(index);
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
                leading: Icon(
                  _todoItems[index].icon,
                  size: 35.0,
                ),
                title: Text(_todoItems[index].title),
                trailing: IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(_todoItems[index].title),
                      actions: [
                        IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.purpleAccent,
                          onPressed: () {
                            _deleteTodo(index);
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final Todo todo = await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CreatePage()));
          if (todo != null) _addTodo(todo);
        },
        tooltip: 'Add ToDo',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Todo {
  String title;
  IconData icon;

  Todo(this.title, this.icon);
}
