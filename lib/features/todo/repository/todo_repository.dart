import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/todo.dart';

abstract class BaseTodoRepository {
  Future<void> createTodo(Todo todo);
  Future<void> removeTodo(String id);
  Future<void> editTodo(Todo todo);
  Future<List<Todo>> getTodos();
}

class TodoRepository implements BaseTodoRepository {
  final firestore = FirebaseFirestore.instance;

  @override
  Future<void> createTodo(Todo todo) async {
    final email = FirebaseAuth.instance.currentUser?.email;
    final todos = firestore.collection('users').doc(email).collection('todos');
    await todos.doc(todo.id).set(todo.toMap());
  }

  @override
  Future<void> editTodo(Todo todo) async {
    final email = FirebaseAuth.instance.currentUser?.email;
    firestore.collection('users').doc(email).collection('todos').doc(todo.id).update(todo.toMap());
  }

  @override
  Future<List<Todo>> getTodos() async {
    final email = FirebaseAuth.instance.currentUser?.email;
    final todos = await firestore.collection('users').doc(email).collection('todos').get();
    return todos.docs.map((e) => Todo.fromDocument(e)).toList();
  }

  @override
  Future<void> removeTodo(String id) async {
    final email = FirebaseAuth.instance.currentUser?.email;
    firestore.collection('users').doc(email).collection('todos').doc(id).delete();
  }
}
