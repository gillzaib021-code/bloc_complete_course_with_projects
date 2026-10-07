import 'package:equatable/equatable.dart';

abstract class CounterEvent extends Equatable {


  @override
  // TODO: implement props
  List<Object?> get props => [];
  
}

class IncrementCounter extends CounterEvent {
  
}
class DecrementCounter extends CounterEvent {
  
}