import 'package:first_app/model/todo_model.dart';
import 'package:flutter/material.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Todo')),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          children: [
            TextFormField(
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Informe o título',
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              decoration: const InputDecoration(
                hintText: 'Informe a descrição',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final todo = TodoModel(
                  titleController.text,
                  descriptionController.text,
                );
                Navigator.of(context).pop(todo);
              },
              child: const Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
