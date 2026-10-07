import 'package:bloc/bloc.dart';
import 'package:bloc_complete_course/bloc/counter/counter_event.dart';
import 'package:bloc_complete_course/bloc/counter/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() :super(CounterState()){
   on<IncrementCounter>(_increment);
   on<DecrementCounter>(_Decrement);
  }

  void _increment(IncrementCounter event, Emitter<CounterState> emit){
   emit(state.copyWith(counter: state.counter +1));
  }

   void _Decrement(DecrementCounter event, Emitter<CounterState> emit){
   emit(state.copyWith(counter: state.counter -1));
  }
}