import '../repository/todo.dart';
import 'delete_todo.dart';

class DeleteTodoUseCaseImpl extends DeleteTodoUseCase {
  DeleteTodoUseCaseImpl(this._todoRepository);
  final TodosRepository _todoRepository;

  @override
  Future<void> execute(String todoId) async =>
      await _todoRepository.deleteTodo(todoId);
}
