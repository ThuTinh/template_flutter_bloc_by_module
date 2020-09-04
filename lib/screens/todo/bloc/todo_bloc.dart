import 'package:bloc/bloc.dart';
import 'package:core/models/models.dart';
import 'package:core/repositories/repository.dart';
import 'package:core/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoRepository todoRepository = serviceLocator<TodoRepository>();
  TodoBloc() : super(ReadyGetTodo());

  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is GetTodos) {
      List<Todo> todos = await todoRepository.getListTodoOfUser(event.userId);
      if (todos != null) {
        yield GetTodoSucess(todos: todos);
      } else {
        yield GetToDoFail(message: "cannot get to do");
      }
    }
  }
}
