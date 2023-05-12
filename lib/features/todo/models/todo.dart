// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String? id;
  final String task;
  final String description;
  final DateTime date;
  final String category;
  final bool completed;

  Todo({
    this.id,
    required this.task,
    required this.description,
    required this.date,
    required this.category,
    required this.completed,
  });

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    DateTime? date,
    String? category,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      date: date ?? this.date,
      category: category ?? this.category,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'description': description,
      'date': date.toString(),
      'category': category,
      'completed': completed,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] != null ? map['id'] as String : null,
      task: map['task'] as String,
      description: map['description'] as String,
      date: DateTime.parse(map['date']),
      category: map['category'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Todo(id: $id, task: $task, description: $description, date: $date, category: $category, completed: $completed)';
  }

  factory Todo.fromDocument(QueryDocumentSnapshot doc) => Todo(
        id: doc.id,
        task: doc.get('task'),
        description: doc.get('description'),
        completed: doc.get('completed'),
        date: DateTime.parse(doc.get('date')),
        category: doc.get("category"),
      );

  @override
  bool operator ==(covariant Todo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.task == task &&
        other.description == description &&
        other.date == date &&
        other.category == category &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        task.hashCode ^
        description.hashCode ^
        date.hashCode ^
        category.hashCode ^
        completed.hashCode;
  }
}
