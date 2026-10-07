import 'package:bloc/bloc.dart';
import 'package:bloc_complete_course/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_complete_course/bloc/todo_bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoState([])) {
    on<AddTodo>((event, emit) {
      final updatedList = List<String>.from(state.tasks);
      updatedList.add(event.task);

      emit(TodoState(updatedList));
    });

    on<DeleteTodo>((event, emit) {
      final updatedList = List<String>.from(state.tasks);
      updatedList.removeAt(event.index);

      emit(TodoState(updatedList));
    });
  }
}


