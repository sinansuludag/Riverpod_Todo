import 'package:riverpod/riverpod.dart';
import 'package:riverpod_todo_app/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoListManager extends StateNotifier<List<TodoModel>> {
  TodoListManager([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo({required String description}) {
    var eklenecekTodo =
        TodoModel(id: const Uuid().v4(), description: description);
    state = [...state, eklenecekTodo];
  }

  void toggle({required String id}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: id,
              description: todo.description,
              isCompleted: !todo.isCompleted)
        else
          todo
    ];
  }

  void edit({required String id, required String newDescription}) {
    state = [
      for (var todo in state)
        if (todo.id == id)
          TodoModel(
              id: id,
              description: newDescription,
              isCompleted: todo.isCompleted)
        else
          todo
    ];
  }

  void remove(TodoModel silinecekTodo) {
    state = state
        .where(
          (element) => element.id != silinecekTodo.id,
        )
        .toList();
  }
}
