import 'package:riverpod/riverpod.dart';
import 'package:riverpod_todo_app/models/todo_model.dart';
import 'package:riverpod_todo_app/providers/todo_list_manager.dart';

enum TodoListFilter { all, active, completed }

final todoListFilterProvider = StateProvider<TodoListFilter>(
  (ref) {
    return TodoListFilter.all;
  },
);

final filteredTodoListProvider = Provider<List<TodoModel>>(
  (ref) {
    final filter = ref.watch(todoListFilterProvider);
    final todoList = ref.watch(todoListProvider);
    switch (filter) {
      case TodoListFilter.all:
        return todoList;
      case TodoListFilter.completed:
        return todoList
            .where(
              (element) => element.isCompleted,
            )
            .toList();
      case TodoListFilter.active:
        return todoList
            .where(
              (element) => !element.isCompleted,
            )
            .toList();
    }
  },
);

final todoListProvider =
    StateNotifierProvider<TodoListManager, List<TodoModel>>(
  (ref) {
    return TodoListManager([]);
  },
);

final unCompletedTodoCountProvider = Provider<int>(
  (ref) {
    final allTodo = ref.watch(todoListProvider);
    final count = allTodo
        .where(
          (element) => !element.isCompleted,
        )
        .length;
    return count;
  },
);

final currentTodoProvider = Provider<TodoModel>(
  (ref) {
    throw UnimplementedError();
  },
);
