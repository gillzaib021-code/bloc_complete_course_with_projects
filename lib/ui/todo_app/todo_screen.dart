// import 'package:bloc_complete_course/bloc/todo_bloc/todo_bloc.dart';
// import 'package:bloc_complete_course/bloc/todo_bloc/todo_bloc.dart';
// import 'package:bloc_complete_course/bloc/todo_bloc/todo_event.dart';
// import 'package:bloc_complete_course/bloc/todo_bloc/todo_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class TodoScreen extends StatefulWidget {
//   const TodoScreen({super.key});

//   @override
//   State<TodoScreen> createState() => _TodoScreenState();
// }

// class _TodoScreenState extends State<TodoScreen> {
//   final TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("BLoC Todo App"),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             TextField(
//               controller: controller,
//               decoration: InputDecoration(
//                 hintText: "Enter Task",
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 10),

//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (controller.text.trim().isNotEmpty) {
//                     context.read<TodoBloc>().add(
//                           AddTodo(controller.text.trim()),
//                         );

//                     controller.clear();
//                   }
//                 },
//                 child: const Text("Add Task"),
//               ),
//             ),

//             const SizedBox(height: 20),

//             Expanded(
//               child: BlocBuilder<TodoBloc, TodoState>(
//                 builder: (context, state) {
//                   if (state.tasks.isEmpty) {
//                     return const Center(
//                       child: Text("No Tasks Added"),
//                     );
//                   }

//                   return ListView.builder(
//                     itemCount: state.tasks.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: ListTile(
//                           title: Text(state.tasks[index]),
//                           trailing: IconButton(
//                             icon: const Icon(
//                               Icons.delete,
//                               color: Colors.red,
//                             ),
//                             onPressed: () {
//                               context.read<TodoBloc>().add(
//                                     DeleteTodo(index),
//                                   );
//                             },
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:bloc_complete_course/bloc/todo_bloc/todo_bloc.dart';
import 'package:bloc_complete_course/bloc/todo_bloc/todo_event.dart';
import 'package:bloc_complete_course/bloc/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final TextEditingController taskctrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App', style: TextStyle(color: const Color.fromRGBO(255, 255, 255, 1), fontWeight: FontWeight.bold),),
        backgroundColor: Colors.amber,
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: taskctrl,
              decoration: InputDecoration(
                hintText: 'Enter your task',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
        
                ),
              ),
            ),
             SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              if (taskctrl.text.trim().isNotEmpty){
                context.read<TodoBloc>().add(
                  AddTodo(taskctrl.text.trim()),
                );
                taskctrl.clear();
              }
            }, child: Text('Add Task'),
            ),

           SizedBox(height: 30,),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state){
                if (state.tasks.isEmpty) {
                  return Center(
                    child: Text('No Task yet'),
                  );
                  
                }
                return ListView.builder(
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index){
                  return Card(
                    child: ListTile(
                      title: Text(state.tasks[index]),
                      trailing: IconButton(onPressed: (){
                          context.read<TodoBloc>().add(DeleteTodo(index));
                      }, icon:Icon(Icons.delete,color: Colors.red,)
                      ),
                    ),
                  );
                  }
                  );
              }),
            )
          ],
        ),
      ),
    );
  }
}