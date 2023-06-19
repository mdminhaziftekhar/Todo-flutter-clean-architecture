import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:todo_clean_architecture/domain/model/todo.dart';
import 'package:todo_clean_architecture/domain/model/todos.dart';

import '../../domain/repository/todos.dart';
import '../source/files.dart';

class TodosRepositoryImpl extends TodosRepository {
  TodosRepositoryImpl(this.files);
  final Files files;
  late final String path = 'todos.json';

  @override
  Future<void> deleteAllTodos() async {
    await files.delete(path);
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    final todos = await loadTodos();

    // Remove the todo from the list
    final newTodos = todos.values.where((t) => t.id != todo.id).toList();

    // Save the new list
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }

  @override
  Future<Todos> loadTodos() async {
    // load the todos from path
    final content = await files.read(path);

    if (content == null) return const Todos(values: []);

    // Transform it to json and then the todos list

    return Todos.fromJson(jsonDecode(content));
  }

  @override
  Future<Todo?> getTodoById(String id) async {
    final todos = await loadTodos();

    // search the todo by id
    return todos.values.firstWhereOrNull((todo) => todo.id == id);
  }

  @override
  Future<void> saveTodo(Todo todo) async {
    final todos = await loadTodos();

    // Remove the todo from the list if it already exists
    final newTodos =
        todos.values.where((element) => element.id != todo.id).toList();

    // Add the new todo
    newTodos.add(todo);

    // save the new list
    await files.write(path, jsonEncode(Todos(values: newTodos).toJson()));
  }
}
