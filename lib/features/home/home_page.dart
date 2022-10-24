import 'package:first_app/features/home/home_controller.dart';
import 'package:first_app/model/todo_model.dart';
import 'package:flutter/material.dart';

import 'home_states.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController controller;
  late Widget body;
  final pageController = PageController();

  void changePage(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    controller = HomeController(() => setState(() {}));
    controller.init();
  }

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
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Container(
            color: Colors.pink,
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  controller.logout();
                },
                child: const Text('Logout'),
              ),
            ),
          ),
          BuildWidget(controller: controller),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.of(context).pushNamed<TodoModel>(
            'create-todo',
            arguments: 'Kaio',
          );
          if (result != null) {
            controller.addTodo(result);
          }
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: MyBottomBar(changePage: changePage),
    );
  }
}

class BuildWidget extends StatelessWidget {
  final HomeController controller;
  const BuildWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: ((context) {
        if (controller.state is HomeStateLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.state is HomeStateError) {
          return const Center(
            child: Text('Ops, houve um erro'),
          );
        } else {
          return ListView.builder(
            itemCount: controller.todos.length,
            itemBuilder: (context, index) {
              final item = controller.todos[index];
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.description),
              );
            },
          );
        }
      }),
    );
  }
}
