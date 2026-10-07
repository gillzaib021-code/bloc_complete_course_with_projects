import 'package:equatable/equatable.dart';

abstract class ImagePickerEvent extends Equatable {
  const ImagePickerEvent();

  @override
  List <Object> get props=>[];
}


class CameraImagePicker extends ImagePickerEvent {}

class GalleryImagePicker extends ImagePickerEvent {}