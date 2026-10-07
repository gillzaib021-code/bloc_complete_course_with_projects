import 'dart:io';

import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker with Bloc'),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            if (state.file == null) {
              return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraImagePicker());
                },
                child: const CircleAvatar(
                  child: Icon(Icons.camera),
                ),
              );
            }
        
            return Image.file(File(state.file!.path));
          },
        ),
      ),
    );
  }
}