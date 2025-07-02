import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base/base_state.dart';
import 'package:flutter_mobx/flutter_mobx.dart'; // IMPORTANTE
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends BaseState<TodoPage, TodoController> {
  final TextEditingController inputController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final store = controller.store;
    return Scaffold(
      appBar: AppBar(title: const Text('Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(hintText: "Nova tarefa"),
                  ),
                ),
                const SizedBox(width: 8),
                Observer(
                  builder: (_) => ElevatedButton(
                    onPressed: store.isLoading
                        ? null
                        : () async {
                            await controller.create(inputController.text);
                            inputController.clear();
                          },
                    child: store.isLoading
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text("Adicionar"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: Observer(
                builder: (_) => ListView(
                  children: store.todos.map((todo) {
                    return ListTile(
                      title: Text(todo.title),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => controller.delete(todo.id),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
