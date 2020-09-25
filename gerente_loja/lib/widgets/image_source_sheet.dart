import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceSheet extends StatelessWidget {
  final Function(File) onImageSelected;

  ImageSourceSheet({this.onImageSelected});

  void _imageSelected(PickedFile image) async {
    if (image != null) {
      File croppedImage = await ImageCropper.cropImage(
        sourcePath: image.path,
        aspectRatio: CropAspectRatio(
          ratioX: 1.0,
          ratioY: 1.0,
        ),
      );
      onImageSelected(croppedImage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FlatButton(
            child: Text('Câmera'),
            onPressed: () async {
              PickedFile image = await ImagePicker().getImage(
                source: ImageSource.camera,
              );
              _imageSelected(image);
            },
          ),
          FlatButton(
            child: Text('Galeria'),
            onPressed: () async {
              PickedFile image = await ImagePicker().getImage(
                source: ImageSource.gallery,
              );
              _imageSelected(image);
            },
          )
        ],
      ),
    );
  }
}
