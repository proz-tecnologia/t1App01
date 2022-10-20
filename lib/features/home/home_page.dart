import 'package:first_app/features/home/home_controller.dart';
import 'package:first_app/model/todo_model.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var valor = 0;
  late final HomeController controller;

  void increment() {
    setState(() {
      valor++;
    });
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(() => setState(() {}));
  }

  final items = List.generate(2000, (index) => MyWidget(index));
  final isSmallScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final item = controller.todos[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
          );
        },
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed('create-todo');
          if (result != null) {
            controller.addTodo(result as TodoModel);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
