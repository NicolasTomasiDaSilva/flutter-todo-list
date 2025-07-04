import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
import 'package:flutter_application_1/modules/todo/pages/create_or_edit_todo_page.dart';
import 'package:flutter_application_1/modules/todo/pages/todo_page.dart';
import 'package:flutter_application_1/modules/todo/services/todo_service.dart';
import 'package:flutter_application_1/modules/todo/stores/todo_store.dart';
import 'package:flutter_application_1/setupdi.dart';

void main() {
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TodoPage(),
    );
  }
}
