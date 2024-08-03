// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_todo_app/providers/all_providers.dart';

class TodoListItemWidget extends ConsumerStatefulWidget {
  const TodoListItemWidget({
    super.key,
  });

  @override
  ConsumerState<TodoListItemWidget> createState() => _TodoListItemWidgetState();
}

class _TodoListItemWidgetState extends ConsumerState<TodoListItemWidget> {
  late FocusNode _textFocus;
  late TextEditingController _textcontroller;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textFocus = FocusNode();
    _textcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _textFocus.dispose();
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTodoItem = ref.watch(currentTodoProvider);
    return Focus(
      onFocusChange: (isFocus) {
        if (!isFocus) {
          setState(() {
            _hasFocus = false;
          });
          ref.read(todoListProvider.notifier).edit(
              id: currentTodoItem.id, newDescription: _textcontroller.text);
        }
      },
      child: ListTile(
        onTap: () {
          setState(() {
            _hasFocus = true;
            _textFocus.requestFocus();
            _textcontroller.text = currentTodoItem.description;
          });
        },
        leading: Checkbox(
          value: currentTodoItem.isCompleted,
          onChanged: (value) {
            ref.read(todoListProvider.notifier).toggle(id: currentTodoItem.id);
          },
        ),
        title: _hasFocus
            ? TextField(
                controller: _textcontroller,
                focusNode: _textFocus,
              )
            : Text(currentTodoItem.description),
      ),
    );
  }
}
