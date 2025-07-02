import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base/base_state.dart';
import 'package:flutter_application_1/modules/todo/components/todo_form_dialog.dart';
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends BaseState<TodoPage, TodoController> {
  final TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final store = controller.store;

    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Observer(
                builder: (_) => ListView(
                  children: store.todos.map((todo) {
                    return ListTile(
                      title: Text(todo.title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () async {
                              await showDialog(
                                context: context,
                                builder: (_) => TodoFormDialog(
                                  initialValue: todo.title,
                                  onConfirm: (newTitle) {
                                    todo.title = newTitle;
                                    controller.update(todo);
                                  },
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => controller.delete(todo.id),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (_) => TodoFormDialog(onConfirm: controller.create),
          );
        },
      ),
    );
  }
}
