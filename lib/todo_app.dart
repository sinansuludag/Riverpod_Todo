import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:riverpod_todo_app/providers/all_providers.dart';
import 'package:riverpod_todo_app/widgets/title_widget.dart';
import 'package:riverpod_todo_app/widgets/todo_list_item_widget.dart';
import 'package:riverpod_todo_app/widgets/toolbar_widget.dart';

class TodoApp extends ConsumerWidget {
  TodoApp({super.key});
  final newController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var allList = ref.watch(filteredTodoListProvider);
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: 0.03.sw,
          ),
          children: [
            const TitleWidget(),
            TextField(
              controller: newController,
              decoration: const InputDecoration(
                labelText: "Bugün neler yapacaksın?",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
              onSubmitted: (description) {
                if (description.isNotEmpty) {
                  ref
                      .read(todoListProvider.notifier)
                      .addTodo(description: description);
                  newController.text = "";
                }
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            const ToolBarWidget(),
            for (var i = 0; i < allList.length; i++)
              Dismissible(
                  background: Center(
                    child: Text("Siliniyor"),
                  ),
                  key: ValueKey(allList[i].id),
                  onDismissed: (_) {
                    ref.read(todoListProvider.notifier).remove(allList[i]);
                  },
                  //Burada ilk başta currenTodoProvider bir hata donduruyor eger bir değer atanmazsa.Biz değeri burda atıyoruz
                  //ve hata fırlatmasını engelliyoruz.Nasıl yapıyoruz? TodoListItemWidget widgetini ProviderScopla sarıp ProviderScopun
                  //overrideWithValue metodundan yararlanıp fırlatılan hatayı override edip uygun değeri alıp gonderiyoruz.
                  child: ProviderScope(overrides: [
                    currentTodoProvider.overrideWithValue(allList[i])
                  ], child: const TodoListItemWidget()))
          ],
        ),
      ),
    );
  }
}
