import 'package:flutter/material.dart';
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return TodoPage();
  }
}
