import '../../features/todo/models/todo.dart';

extension ListTodoExtension on List<Todo> {
  List<Todo> get completed {
    return where((element) => element.completed).toList();
  }

  List<Todo> get pending {
    return where((element) => !element.completed).toList();
  }

  List<Todo> get sorted {
    final list = this;
    list.sort((a, b) => a.date.compareTo(b.date));
    return list;
  }
}
