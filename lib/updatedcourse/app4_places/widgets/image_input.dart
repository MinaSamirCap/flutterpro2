import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  final Function onSelectedImage;

  ImageInput(this.onSelectedImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storeImage;

  Future<void> _takePictuer() async {
    final imageFile =
        await ImagePicker.pickImage(source: ImageSource.camera, maxHeight: 600);

    if (imageFile == null) return;
    
    setState(() {
      _storeImage = imageFile;
    });

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    widget.onSelectedImage(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Container(
        width: 150,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: _storeImage != null
            ? Image.file(
                _storeImage,
                fit: BoxFit.cover,
                width: double.infinity,
              )
            : Text(
                'No Image Taken',
                textAlign: TextAlign.center,
              ),
        alignment: Alignment.center,
      ),
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: FlatButton.icon(
        icon: Icon(Icons.camera),
        label: Text('Take A Picture'),
        textColor: Theme.of(context).primaryColor,
        onPressed: _takePictuer,
      ))
    ]);
  }
}
