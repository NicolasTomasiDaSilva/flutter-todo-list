import 'package:flutter_application_1/modules/todo/controllers/user_controller.dart';
import 'package:flutter_application_1/modules/todo/dtos/create_todo.dart';
import 'package:flutter_application_1/modules/todo/models/todo_model.dart'
    show Todo;
import 'package:flutter_application_1/modules/todo/services/todo_service.dart';
import 'package:flutter_application_1/modules/todo/stores/todo_store.dart';
import 'package:get_it/get_it.dart';

class TodoController {
  final TodoStore store;
  final TodoService service;
  final UserController userController;

  TodoController(this.store, this.service, this.userController);

  Future<void> create(String title) async {
    try {
      store.isLoading = true;
      final todo = await service.create(CreateTodoDTO(title: title));
      store.add(todo);
    } catch (e) {
      print(e);
    } finally {
      store.isLoading = false;
    }
  }

  Future<void> delete(String id) async {
    try {
      store.isLoading = true;
      await service.delete(id);
      store.remove(id);
    } catch (e) {
      print(e);
    } finally {
      store.isLoading = false;
    }
  }

  Future<void> update(Todo todo) async {
    try {
      store.isLoading = true;
      await service.update(todo);
      store.update(todo);
    } catch (e) {
      print(e);
    } finally {
      store.isLoading = false;
    }
  }
}
