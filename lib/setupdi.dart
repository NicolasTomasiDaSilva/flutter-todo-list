import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
import 'package:flutter_application_1/modules/todo/controllers/user_controller.dart';
import 'package:flutter_application_1/modules/todo/services/todo_service.dart';
import 'package:flutter_application_1/modules/todo/stores/todo_store.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<UserController>(UserController());
  getIt.registerSingleton<TodoStore>(TodoStore());
  getIt.registerSingleton<TodoService>(TodoService());
  getIt.registerSingleton<TodoController>(
    TodoController(getIt(), getIt(), getIt()),
  );
}
