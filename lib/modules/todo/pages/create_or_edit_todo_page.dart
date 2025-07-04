import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/base/base_state.dart';
import 'package:flutter_application_1/modules/todo/components/todo_form_dialog.dart';
import 'package:flutter_application_1/modules/todo/controllers/todo_controller.dart';
import 'package:flutter_application_1/modules/todo/models/todo_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CreateOrEditTodoPage extends StatefulWidget {
  final Todo? todo;

  const CreateOrEditTodoPage({super.key, this.todo});

  @override
  State<CreateOrEditTodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends BaseState<CreateOrEditTodoPage, TodoController> {
  late final TextEditingController inputController;
  final _formKey = GlobalKey<FormState>();
  late final bool isEditing;

  @override
  void initState() {
    super.initState();
    inputController = TextEditingController(text: widget.todo?.title ?? '');
    isEditing = widget.todo != null;
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void submit() {
    if (_formKey.currentState!.validate()) {
      if (isEditing) {
        widget.todo!.title = inputController.text.trim();
        controller.update(widget.todo!);
      } else {
        controller.create(inputController.text.trim());
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final store = controller.store;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar tarefa' : 'Nova tarefa'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              submit();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Observer(
                  builder: (_) => TextFormField(
                    controller: inputController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'O título não pode estar vazio';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Título da tarefa',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
