import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/core/locale.dart';
import 'package:get_app/theme/theme.dart';
import 'package:get_app/views/cart_view.dart';
import 'package:get_app/views/todo_create_view.dart';
import 'package:get_app/views/todo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Messages(),
      locale: Locale('en', 'US'),
      fallbackLocale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      theme: customTheme,
      title: 'Shopping',
      home: TodoView(),
      getPages: [
        GetPage(
            name: '/create',
            page: () => TodoCreateView(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/cart',
            page: () => CartView(),
            transition: Transition.rightToLeft)
      ],
    );
  }
}
