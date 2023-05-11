import 'package:elred/features/todo/models/todo.dart';
import 'package:elred/features/todo/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> todos = [];

  final BaseTodoRepository _todoRepository;

  TodoProvider(this._todoRepository) {
    getTodos();
  }

  Future<void> addTodo(Todo todo) async {
    todo = todo.copyWith(id: const Uuid().v4());
    await _todoRepository.createTodo(todo);
    todos.add(todo);
    notifyListeners();
  }

  Future<void> updateTodo(Todo todo) async {
    await _todoRepository.editTodo(todo);
    final index = todos.indexWhere((e) => e.id == todo.id);
    todos[index] = todo;
    notifyListeners();
  }

  Future<void> deleteTodo(Todo todo) async {
    if (todo.id == null) return;
    await _todoRepository.removeTodo(todo.id!);
    todos.removeWhere((e) => e.id == todo.id);
    notifyListeners();
  }

  Future<void> getTodos() async {
    final t = await _todoRepository.getTodos();
    todos.addAll(t);
    notifyListeners();
  }
}
