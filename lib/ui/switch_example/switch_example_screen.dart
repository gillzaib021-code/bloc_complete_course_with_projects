import 'package:bloc_complete_course/bloc/switch_example/swich_event.dart';
import 'package:bloc_complete_course/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_complete_course/bloc/switch_example/switch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchExampleScreen extends StatefulWidget {
  const SwitchExampleScreen({super.key});

  @override
  State<SwitchExampleScreen> createState() => _SwitchExampleScreenState();
}

class _SwitchExampleScreenState extends State<SwitchExampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example two with Bloc'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Text('Notification'),
                  BlocBuilder<SwitchBloc, SwitchState>(
                    buildWhen: (previous, current) => previous.isSwitch!=current.isSwitch,
                    builder: (context, state){
                      return Switch(value: state.isSwitch, onChanged: (newValue){
                        context.read<SwitchBloc>().add(EnableorDisableNotification());
                      });
                    }
                    ),
              ],
            ),
            SizedBox(height: 30,),

             BlocBuilder<SwitchBloc, SwitchState>(
              buildWhen: (previous, current) => previous.isSwitch!=current.isSwitch,
                    builder: (context, state){
                      return Slider(value: state.slider, onChanged: (value){});
                    }
                    ),


                    BlocBuilder<SwitchBloc, SwitchState>(
                      buildWhen: (previous, current) => previous.isSwitch!=current.isSwitch,
                    builder: (context, state){
                              return  Container(
                               height: 200,
                               color: Colors.blueAccent.withOpacity(state.slider),
                     ); 
                    }
                    ),
           
            SizedBox(height: 30,),
             BlocBuilder<SwitchBloc, SwitchState>(
                    builder: (context, state){
                      return Slider(value: state.slider, onChanged: (vlaue){

                        context.read<SwitchBloc>().add(SliderEvent(slider: vlaue));
                      });
                      
                    }
                    ),
            

          ],
        ),
      ),
    );
  }
}