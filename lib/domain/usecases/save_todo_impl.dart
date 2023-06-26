import '../model/todo.dart';
import '../repository/todo.dart';
import 'save_todo.dart';

class SaveTodoUseCaseImpl implements SaveTodoUseCase {
  SaveTodoUseCaseImpl(this.repository);
  final TodosRepository repository;

  @override
  Future<void> execute(Todo todo) async => await repository.saveTodo(todo);
}
