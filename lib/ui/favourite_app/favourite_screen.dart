import 'package:bloc_complete_course/bloc/favourite/bloc/favourite_bloc.dart';
import 'package:bloc_complete_course/bloc/favourite/bloc/favourite_event.dart';
import 'package:bloc_complete_course/bloc/favourite/bloc/favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text("Favourite App", style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter Item",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                onPressed: () {
                  
                  if (controller.text.trim().isNotEmpty) {
                    context.read<FavouriteBloc>().add(
                      AddItemEvent(controller.text.trim()),
                    );

                    controller.clear();
                  }
                },
                child: const Text("Add Item", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: BlocBuilder<FavouriteBloc, FavouriteState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.items.length,
                    itemBuilder: (context, index) {
                      final item = state.items[index];

                      return Card(
                        child: ListTile(
                          title: Text(item.name),
                          trailing: IconButton(
                            onPressed: () {
                              context.read<FavouriteBloc>().add(
                                ToggleFavouriteEvent(index),
                              );
                            },
                            icon: Icon(
                              item.isfavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: item.isfavourite
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}