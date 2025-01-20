import 'package:crud_opreation/add_page.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo List")),
        backgroundColor: Colors.black45,
      ),
floatingActionButton: FloatingActionButton.extended(
    onPressed: navigateToAddPage,
  label:const Text('Add Todo'),
),
    );
  }

void navigateToAddPage(){
    final route =MaterialPageRoute(
        builder: (context) =>const AddToDoPage()
    );
    Navigator.push(context, route);
}
}
