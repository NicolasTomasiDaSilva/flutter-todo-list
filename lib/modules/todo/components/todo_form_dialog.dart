import 'package:flutter/material.dart';

class TodoFormDialog extends StatefulWidget {
  final String? initialValue;
  final void Function(String value) onConfirm;

  const TodoFormDialog({super.key, this.initialValue, required this.onConfirm});

  @override
  State<TodoFormDialog> createState() => _TodoFormDialogState();
}

class _TodoFormDialogState extends State<TodoFormDialog> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      widget.onConfirm(_controller.text.trim());
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.initialValue != null;
    return AlertDialog(
      title: Text(isEdit ? 'Editar tarefa' : 'Nova tarefa'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _controller,
          decoration: const InputDecoration(labelText: 'Título'),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Informe um título';
            }
            if (value.trim().length < 3) {
              return 'Título muito curto';
            }
            return null;
          },
          autofocus: true,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        ElevatedButton(onPressed: _submit, child: const Text('Confirmar')),
      ],
    );
  }
}
