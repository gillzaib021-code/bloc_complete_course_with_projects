import 'package:bloc_complete_course/bloc/counter/counter_bloc.dart';
import 'package:bloc_complete_course/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_complete_course/bloc/switch_example/switch_bloc.dart';
import 'package:bloc_complete_course/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_complete_course/bloc/user/bloc/user_bloc.dart';
import 'package:bloc_complete_course/repsotory/user_repository.dart';
import 'package:bloc_complete_course/ui/api/api_home_screen.dart';
import 'package:bloc_complete_course/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      
      providers: [
       BlocProvider(create: (_)=>CounterBloc()),
       BlocProvider(create: (_)=>SwitchBloc()),
       BlocProvider(create: (_)=>ImagePickerBloc(ImagePickerUtils())),
       BlocProvider(create: (_)=>TodoBloc()),
        BlocProvider(create: (_)=>FavouriteBloc()),
        BlocProvider(create: (_)=> UserBloc(UserRepository()))
        
      ],
      
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Complete course',
        theme: ThemeData(
         
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const ApiHomeScreen (),
      ),
      
      );
  
  }
}

