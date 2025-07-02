import 'package:flutter_application_1/modules/todo/dtos/create_todo.dart';
import 'package:flutter_application_1/modules/todo/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoService {
  final List<Todo> _memoryDb = [];
  final _uuid = Uuid();

  Future<Todo> create(CreateTodoDTO dto) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final newTodo = Todo(id: _uuid.v4(), title: dto.title, isDone: false);
    _memoryDb.add(newTodo);
    return newTodo;
  }

  Future<void> delete(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _memoryDb.removeWhere((todo) => todo.id == id);
  }
}
