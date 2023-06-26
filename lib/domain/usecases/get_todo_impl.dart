import '../model/todo.dart';
import '../repository/todo.dart';
import 'get_todo.dart';

class GetTodoUseCaseImpl implements GetTodoUseCase {
  GetTodoUseCaseImpl(this._todoRepository);
  final TodosRepository _todoRepository;

  @override
  Future<Todo?> execute(String id) async =>
      await _todoRepository.getTodoById(id);
}
