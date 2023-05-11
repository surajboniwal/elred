import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  final String? id;
  final String task;
  final DateTime date;
  final bool completed;

  Todo({
    this.id,
    required this.task,
    required this.date,
    required this.completed,
  });

  Todo copyWith({
    String? id,
    String? task,
    DateTime? date,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      date: date ?? this.date,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'task': task});
    result.addAll({'date': date.toString()});
    result.addAll({'completed': completed});

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] ?? '',
      task: map['task'] ?? '',
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(id: $id, task: $task, date: $date, completed: $completed)';
  }

  factory Todo.fromDocument(QueryDocumentSnapshot doc) => Todo(
        id: doc.id,
        task: doc.get('task'),
        completed: doc.get('completed'),
        date: DateTime.parse(doc.get('date')),
      );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.id == id &&
        other.task == task &&
        other.date == date &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return id.hashCode ^ task.hashCode ^ date.hashCode ^ completed.hashCode;
  }
}
