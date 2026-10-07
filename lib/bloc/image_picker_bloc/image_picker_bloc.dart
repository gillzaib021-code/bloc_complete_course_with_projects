import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_event.dart';
import 'package:bloc_complete_course/bloc/image_picker_bloc/image_picker_state.dart';
import 'package:bloc_complete_course/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {


  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()){
    on<CameraImagePicker>(camperaimagepicker);
  }

  void camperaimagepicker(CameraImagePicker event, Emitter<ImagePickerState> emit) async {
   XFile? file = await imagePickerUtils.camperaimagepicker();
   emit(state.copyWith(file: file));
  }
}