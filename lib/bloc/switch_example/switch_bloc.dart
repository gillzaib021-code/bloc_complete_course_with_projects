import 'package:bloc_complete_course/bloc/switch_example/swich_event.dart';
import 'package:bloc_complete_course/bloc/switch_example/switch_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchBloc extends Bloc<SwichEvent, SwitchState> {
  SwitchBloc():super(SwitchState()){
    on<EnableorDisableNotification>(_enableordisablenotification);
     on<SliderEvent>(_slidernotification);
    
  }

  void _enableordisablenotification(EnableorDisableNotification events, Emitter<SwitchState>emit){
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }


   void _slidernotification(SliderEvent events, Emitter<SwitchState>emit){
    emit(state.copyWith(slider: events.slider));
  }
}