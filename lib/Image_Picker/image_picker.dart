import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService extends ChangeNotifier {
  Future<File> pickImages() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

      return File(pickedFile!.path);
    
  }
}
