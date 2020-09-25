import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  Function({String text, File imgFile}) sendMessage;

  TextComposer(this.sendMessage);

  @override
  _TextComposerState createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {
  TextEditingController _controller = TextEditingController();
  bool _isComposing = false;

  void _submitMessage(String text) {
    widget.sendMessage(text: text);
    _controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.photo_camera),
              onPressed: () async {
                PickedFile imgFile =
                    await ImagePicker().getImage(source: ImageSource.camera);
                if (imgFile != null) {
                  widget.sendMessage(imgFile: File(imgFile.path));
                }
              }),
          Expanded(
              child: TextField(
            decoration:
                InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
            onChanged: (text) {
              setState(() {
                _isComposing = text.isNotEmpty;
              });
            },
            onSubmitted: (text) {
              _submitMessage(text);
            },
            controller: _controller,
          )),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: _isComposing
                ? () {
                    _submitMessage(_controller.text);
                  }
                : null,
          )
        ],
      ),
    );
  }
}
