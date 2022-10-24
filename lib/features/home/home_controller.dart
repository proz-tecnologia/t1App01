import 'dart:convert';

import 'package:first_app/features/home/home_states.dart';
import 'package:first_app/model/todo_model.dart';
import 'package:first_app/shared/application_keys/shared_preferences_keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController {
  final VoidCallback onChangeState;
  HomeController(this.onChangeState);
  late final SharedPreferences prefs;

  HomeState state = HomeStateEmpty();
  var todos = <TodoModel>[];

  Future<void> init() async {
    updateState(HomeStateLoading());
    prefs = await SharedPreferences.getInstance();
    await Future.delayed(const Duration(seconds: 2));

    final localTodos = prefs.getString(SharedPreferencesKeys.todo);

    if (localTodos != null && localTodos.isNotEmpty) {
      final decode = jsonDecode(localTodos) as List;
      final todoModelList =
          decode.map((todo) => TodoModel.fromJson(todo)).toList();
      todos.addAll(todoModelList);
      updateState(HomeStateSuccess());
    } else {
      updateState(HomeStateEmpty());
    }
  }

  void updateState(HomeState newState) {
    state = newState;
    onChangeState();
  }

  void logout() {
    prefs.setBool(SharedPreferencesKeys.userLogged, false);
  }

  Future<void> addTodo(TodoModel todo) async {
    updateState(HomeStateLoading());
    todos.add(todo);

    final todosJson = todos.map((todo) => todo.toJson()).toList();

    prefs.setString(SharedPreferencesKeys.todo, jsonEncode(todosJson));
    await Future.delayed(const Duration(seconds: 2));
    updateState(HomeStateSuccess());
  }
}
