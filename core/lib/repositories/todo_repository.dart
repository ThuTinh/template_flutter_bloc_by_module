part of core.repository;

abstract class TodoRepository {
  Future<List<Todo>> getListTodoOfUser(int userId);
}

class TodoRepositoryImp extends TodoRepository {
  TodoService todoService = TodoService();
  @override
  Future<List<Todo>> getListTodoOfUser(int userId) {
    return todoService.getListTodoOfUser(userId);
  }
}
