import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/model/todo.dart';
import '../viewmodel/module.dart';

class TodoTile extends ConsumerWidget {
  const TodoTile({super.key, required this.todo});
  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(todo.title),
      subtitle: Text(todo.description ?? ''),
      onTap: () {
        context.go('/todos/${todo.id}');
      },
      trailing: Checkbox(
        value: todo.completed,
        onChanged: (value) {
          if (value == null) {
            final newTodo = todo.copyWith(
              completed: value!,
            );
            ref.read(todoListModel).save(newTodo);
          }
        },
      ),
    );
  }
}
