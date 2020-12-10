import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controllers/todo_controller.dart';

class TodoCreateView extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  createTodo() {
    todoController.createTodo(textEditingController.text);
    Get.snackbar('Ok', 'Todo created', snackPosition: SnackPosition.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_textField(context), _actions]),
      ),
    );
  }

  Widget get _appBar => AppBar(
        title: Text('Create'),
      );

  Widget _textField(context) => Expanded(
        child: TextField(
          controller: textEditingController,
          maxLines: 999,
          autocorrect: true,
          style: Theme.of(context).textTheme.headline4,
          autofocus: true,
          decoration: InputDecoration(
              suffix: Icon(Icons.done_all_sharp),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.indigo, width: 5)),
              border: InputBorder.none,
              hintText: 'What do you want to accomplish?'),
        ),
      );

  Widget get _actions => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RaisedButton(
              textColor: Colors.white,
              color: Colors.red[900],
              onPressed: () => Get.back(),
              child: Text('Cancel')),
          RaisedButton(
              textColor: Colors.white,
              color: Colors.green[900],
              onPressed: createTodo,
              child: Text('Add')),
        ],
      );
}
