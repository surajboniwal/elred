import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/todo.dart';

abstract class BaseTodoRepository {
  Future<String> createTodo(Todo todo);
  Future<void> removeTodo(String id);
  Future<void> editTodo(Todo todo);
  Future<List<Todo>> getTodos();
}

class TodoRepository implements BaseTodoRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<String> createTodo(Todo todo) async {
    final todos = firestore.collection('users').doc("suraj").collection('todos');
    final todo0 = await todos.add(todo.toMap());
    return todo0.id;
  }

  @override
  Future<void> editTodo(Todo todo) async {
    firestore
        .collection('users')
        .doc("suraj")
        .collection('todos')
        .doc(todo.id)
        .update(todo.toMap());
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await firestore.collection('users').doc("suraj").collection('todos').get();
    return todos.docs.map((e) => Todo.fromDocument(e)).toList();
  }

  @override
  Future<void> removeTodo(String id) async {
    firestore.collection('users').doc("suraj").collection('todos').doc(id).delete();
  }
}
