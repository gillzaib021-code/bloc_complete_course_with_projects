import 'package:bloc_complete_course/repsotory/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_event.dart';
import 'user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository repository;

  UserBloc(this.repository) : super(UserInitial()) {
    on<FetchUser >(_fetchUsers);
  }

  Future<void> _fetchUsers(
    FetchUser event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());

    try {
      final users = await repository.getUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}