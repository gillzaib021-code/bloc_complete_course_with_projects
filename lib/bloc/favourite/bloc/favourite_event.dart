abstract class FavouriteEvent {}

class AddItemEvent extends FavouriteEvent {
  final String title;

  AddItemEvent(this.title);
}
class ToggleFavouriteEvent extends FavouriteEvent{
  final int index;

  ToggleFavouriteEvent(this.index);
}
