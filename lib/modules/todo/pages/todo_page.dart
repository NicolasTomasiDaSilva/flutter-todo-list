import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base/base_state.dart';
import 'package:flutter_application_1/modules/todo/components/todo_form_dialog.dart';
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
import 'package:flutter_application_1/modules/todo/pages/create_or_edit_todo_page.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends BaseState<TodoPage, TodoController> {
  @override
  Widget build(BuildContext context) {
    final store = controller.store;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tarefas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CreateOrEditTodoPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: store.todos.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(store.todos[index].title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () async {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => CreateOrEditTodoPage(
                                  todo: store.todos[index],
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () =>
                              controller.delete(store.todos[index].id),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
