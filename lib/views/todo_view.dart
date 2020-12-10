import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controllers/todo_controller.dart';

class TodoView extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());

  intiharEt() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.create),
          onPressed: () => Get.toNamed('/create'),
        ),
        body: GetBuilder<TodoController>(
          init: todoController,
          builder: (_) {
            return ListView.separated(
              itemCount: todoController.todos.length,
              itemBuilder: (context, index) {
                var todo = todoController.todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.done,
                    onChanged: (bool val) {
                      todoController.findTodo(todo.text);
                    },
                  ),
                  title: Text(todo.text,
                      style: TextStyle(
                          decoration: todo.done
                              ? TextDecoration.lineThrough
                              : TextDecoration.none)),
                );
              },
              separatorBuilder: (_, __) => Divider(),
            );
          },
        ));
  }
}
