import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  Future<Future<XFile?>> pickImage() async {
    return ImagePicker().pickImage(source: ImageSource.gallery);
  }
}
