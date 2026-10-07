import 'package:bloc_complete_course/model/item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'favourite_event.dart';
import 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  FavouriteBloc() : super(FavouriteState([])) {
    on<AddItemEvent>((event, emit) {
      final updatedList = List<ItemModel>.from(state.items);

      updatedList.add(
        ItemModel(
          id: updatedList.length,
          name: event.title,
        ),
      );

      emit(FavouriteState(updatedList));
    });

    on<ToggleFavouriteEvent>((event, emit) {
      final updatedList = List<ItemModel>.from(state.items);

      updatedList[event.index].isfavourite =
          !updatedList[event.index].isfavourite;

      emit(FavouriteState(updatedList));
    });
  }
}