import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PublicationFromController extends GetxController{

   RxList<File> imageList = <File>[].obs;


     Future<void> pickImages() async {
    final List<XFile> selectedImages =
        await ImagePicker().pickMultiImage(maxHeight: 200, maxWidth: 200);
    
      imageList.value =
          selectedImages.map((image) => File(image.path)).toList();
      log("${imageList}");
  }

}