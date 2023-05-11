import 'package:elred/features/todo/models/todo.dart';
import 'package:elred/features/todo/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> todos = [];

  final BaseTodoRepository todoRepository;

  TodoProvider(this.todoRepository) {
    getTodos();
  }

  Future<void> addTodo(Todo todo) async {
    todo = todo.copyWith(id: const Uuid().v4());
    await todoRepository.createTodo(todo);
    todos.add(todo);
    notifyListeners();
  }

  Future<void> getTodos() async {
    final t = await todoRepository.getTodos();
    todos.addAll(t);
    notifyListeners();
  }
}
