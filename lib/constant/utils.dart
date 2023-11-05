import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';


void snackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}

Future<List<File>> pickImages() async {
List<File> images = [];
  try {
    FilePickerResult? files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (files != null && files.count > 0) {
      for(int i=0;i<files.files.length;i++){
        images.add(File(files.files[i].path!));
      }
    }

    return images;

  } catch (e) {
    print("Error picking images: $e");
    return []; // Return an empty list on error or cancel.
  }
}
