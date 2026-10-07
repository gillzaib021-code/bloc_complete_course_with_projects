import 'package:bloc_complete_course/bloc/user/bloc/user_bloc.dart';
import 'package:bloc_complete_course/bloc/user/bloc/user_event.dart';
import 'package:bloc_complete_course/bloc/user/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ApiHomeScreen extends StatefulWidget {
  const ApiHomeScreen ({super.key});

  @override
  State<ApiHomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ApiHomeScreen> {

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(FetchUser());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Users API With Bloc Archit",style: TextStyle(color: Colors.white),),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {

          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {

                final user = state.users[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        user.id.toString(),
                      ),
                    ),
                    title: Text(user.name),
                    subtitle: Text(user.email),
                  ),
                );
              },
            );
          }

          if (state is UserError) {
            return Center(
              child: Text(state.message),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}