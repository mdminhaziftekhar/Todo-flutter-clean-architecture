import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_clean_architecture/data/repository/todos_impl.dart';
import 'package:todo_clean_architecture/data/source/module.dart';
import 'package:todo_clean_architecture/domain/repository/todos.dart';

final todosProvider = Provider<TodosRepository>((ref) {
  return TodosRepositoryImpl(ref.read(filesProvider));
});
