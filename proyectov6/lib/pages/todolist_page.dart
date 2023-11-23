import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:proyectov6/data/database.dart';
import 'package:proyectov6/util/dialog_box.dart';
import 'package:proyectov6/util/todo_tile.dart';
import 'package:proyectov6/pages/sensors_page.dart';
import 'package:proyectov6/pages/camera_page.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoList();
}

class _TodoList extends State<TodoList> {
  // Reference the hive box
  final _mybox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  // Text controller
  final _controller = TextEditingController();

  @override
  void initState() {
    // Si es la primera vez que se abre la app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // Si ya existen los datos
      db.loadData();
    }
    super.initState();
  }

  // Checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward), // Icono de flecha a la derecha
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Photo()));
            },
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Icono de flecha a la izquierda
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SensorsPage()));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
