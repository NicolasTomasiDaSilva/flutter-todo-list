// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodoStore on _TodoStore, Store {
  late final _$todosAtom = Atom(name: '_TodoStore.todos', context: context);

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_TodoStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$_TodoStoreActionController = ActionController(
    name: '_TodoStore',
    context: context,
  );

  @override
  dynamic add(Todo todo) {
    final _$actionInfo = _$_TodoStoreActionController.startAction(
      name: '_TodoStore.add',
    );
    try {
      return super.add(todo);
    } finally {
      _$_TodoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
todos: ${todos},
isLoading: ${isLoading}
    ''';
  }
}
