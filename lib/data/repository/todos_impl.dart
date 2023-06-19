import 'package:todo_clean_architecture/domain/model/todo.dart';

import '../../domain/repository/todos.dart';
import '../source/files.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);
  final Files files;

  @override
  Future<void> deleteAllTodos() {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTodo(Todo todo) {
    throw UnimplementedError();
  }

  @override
  Future<Todo?> getTodoById(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Todo>> loadTodos() {
    throw UnimplementedError();
  }

  @override
  Future<void> saveTodo(Todo todo) {
    throw UnimplementedError();
  }
}
