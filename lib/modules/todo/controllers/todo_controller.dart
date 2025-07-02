import 'package:flutter_application_1/modules/todo/dtos/create_todo.dart';
import 'package:flutter_application_1/modules/todo/services/todo_service.dart';
import 'package:flutter_application_1/modules/todo/stores/todo_store.dart';

class TodoController {
  final TodoStore store;

  final TodoService service;

  TodoController(this.store, this.service);

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
}
