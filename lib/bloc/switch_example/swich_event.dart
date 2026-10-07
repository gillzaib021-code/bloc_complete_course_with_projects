abstract class SwichEvent {
  SwichEvent();

  @override
  List<Object> get props => [];
}

class EnableorDisableNotification extends SwichEvent {}


class SliderEvent extends SwichEvent {
  double slider;

  SliderEvent({
   required this.slider,
  });

  @override
  List<Object> get props => [slider];

  
}


