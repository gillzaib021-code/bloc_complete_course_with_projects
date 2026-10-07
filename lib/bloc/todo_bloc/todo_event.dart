
abstract class TodoEvent {}
class AddTodo extends TodoEvent {
  final String task;
  AddTodo(this.task);
  
}

class DeleteTodo extends TodoEvent {
  final int index;
  DeleteTodo(this.index);
}