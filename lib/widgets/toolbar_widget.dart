import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/providers/all_providers.dart';

class ToolBarWidget extends ConsumerWidget {
  const ToolBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final unCompletedTodoCount = ref.watch(unCompletedTodoCountProvider);
    final filter = ref.watch(todoListFilterProvider);

    // Enum türündeki filtreye göre renk döndüren fonksiyon
    Color currentTool(TodoListFilter listFilter) {
      return filter == listFilter ? Colors.red : Colors.black;
    }

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            '$unCompletedTodoCount görev kaldı',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        _buildToolTip(
            message: "Tüm görevler",
            title: "Tümü",
            color: currentTool(TodoListFilter.all),
            func: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.all;
            }),
        _buildToolTip(
            message: "Tamamlanmamış görevler",
            title: "Aktif",
            color: currentTool(TodoListFilter.active),
            func: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.active;
            }),
        _buildToolTip(
            message: "Tamamlanmış görevler",
            title: "Tamamlanmış",
            color: currentTool(TodoListFilter.completed),
            func: () {
              ref.read(todoListFilterProvider.notifier).state =
                  TodoListFilter.completed;
            }),
      ],
    );
  }

  Tooltip _buildToolTip({
    required String message,
    required String title,
    required Color color,
    required VoidCallback func,
  }) {
    return Tooltip(
      message: message,
      child: TextButton(
        onPressed: func,
        child: Text(
          title,
          style: TextStyle(
            color: color,
          ),
        ),
      ),
    );
  }
}
