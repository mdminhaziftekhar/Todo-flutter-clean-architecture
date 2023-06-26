import '../model/todos.dart';
import '../repository/todo.dart';
import 'get_todos.dart';

class GetTodosUseCaseImpl extends GetTodosUseCase {
  GetTodosUseCaseImpl(this.todosRepository);
  final TodosRepository todosRepository;

  @override
  Future<Todos> execute() async => todosRepository.loadTodos();
}
