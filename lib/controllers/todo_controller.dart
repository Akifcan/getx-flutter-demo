import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/models/todo_model.dart';

class TodoController extends GetxController {
  RxList<TodoModel> todos = List<TodoModel>().obs;

  createTodo(String text) {
    todos.add(TodoModel(done: false, text: text));
    update();
  }

  findTodo(String text) {
    TodoModel todo = todos.firstWhere((todo) => todo.text == text);
    todo.done = !todo.done;
    update();
    Get.snackbar('Ok', todo.done ? 'Completed' : 'Tick Removed',
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING, snackbarStatus: (status) {
      print(status);
    });
  }
}
