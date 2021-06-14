import 'dart:io';

import 'package:image_picker/image_picker.dart';

Future<File> pickFromGallery() async{
  return await  ImagePicker.pickImage(
    source: ImageSource.gallery, imageQuality: 50
  );    
}