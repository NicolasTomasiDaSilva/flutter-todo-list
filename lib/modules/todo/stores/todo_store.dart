import 'package:flutter_application_1/modules/todo/models/todo_model.dart';
import 'package:mobx/mobx.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  @observable
  List<Todo> todos = [];

  @observable
  bool isLoading = false;

  @action
  add(Todo todo) => todos = [...todos, todo];

  @action
  remove(String id) => todos = todos.where((todo) => todo.id != id).toList();

  @action
  update(Todo todo) =>
      todos = todos.map((t) => t.id == todo.id ? todo : t).toList();
}
