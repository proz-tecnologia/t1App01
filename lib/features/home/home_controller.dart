import 'package:first_app/features/home/home_states.dart';
import 'package:first_app/model/todo_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  final VoidCallback onChangeState;
  HomeController(this.onChangeState);

  HomeState state = HomeStateEmpty();
  var todos = <TodoModel>[];

  void updateState(HomeState newState) {
    state = newState;
    onChangeState();
  }

  Future<void> addTodo(TodoModel todo) async {
    updateState(HomeStateLoading());
    todos.add(todo);
    await Future.delayed(const Duration(seconds: 2));
    updateState(HomeStateSuccess());
  }
}
