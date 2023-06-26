import 'dart:convert';

import 'package:collection/collection.dart';

import '../../domain/model/todo.dart';

import '../../domain/model/todos.dart';
import '../../domain/repository/todo.dart';
import '../source/files.dart';

class TodosRepositoryImpl implements TodosRepository {
  TodosRepositoryImpl(this.files);
  final Files files;

  late final String _path = 'todo.json';

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(_path);
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    final todos = await loadTodos();
    final newTodos =
        todos.values.where((foundTodo) => foundTodo.id != todoId).toList();

    await files.write(_path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<Todos> loadTodos() async {
    final content = await files.read(_path);
    if (content == null) return const Todos(values: []);

    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    // edit the todo if it exists
    final existing =
        todos.values.firstWhereOrNull((foundTodo) => foundTodo.id == todo.id);
    if (existing != null) {
      final newTodo = existing.copyWith(
        title: todo.title,
        description: todo.description,
        completed: todo.completed,
      );
      final newTodos = todos.values
          .map((foundTodo) => foundTodo.id == todo.id ? newTodo : foundTodo)
          .toList();
      await files.write(_path, jsonEncode(Todos(values: newTodos).toJson()));
      return;
    } else {
      final newTodos = [...todos.values, todo];
      await files.write(_path, jsonEncode(Todos(values: newTodos).toJson()));
    }
  }
}
