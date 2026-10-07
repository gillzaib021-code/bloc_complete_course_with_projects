import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  final ImagePicker _picker=ImagePicker();

  Future<XFile?> camperaimagepicker()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }



  Future<XFile?> galleryimagepicker()async{
    final XFile? file = await _picker.pickImage(source: ImageSource.camera);
    return file;
  }
}