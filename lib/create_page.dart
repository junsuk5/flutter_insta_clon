import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePage extends StatefulWidget {
  final User user;

  CreatePage(this.user);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  File _image;
  final picker = ImagePicker();

  Future _getImage() async {
    print('클릭 되나');
    var image = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _image = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 게시물'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            tooltip: '다음',
            onPressed: () {
              _uploadPost(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _buildBody(),
            TextField(
              decoration: InputDecoration(hintText: '내용을 입력하세요'),
              controller: textEditingController,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _uploadPost(BuildContext context) async {
    final firebaseStorageRef = FirebaseStorage.instance
        .ref()
        .child('post')
        .child('${DateTime.now().millisecondsSinceEpoch}.png');

    final task = await firebaseStorageRef.putFile(
        _image, SettableMetadata(contentType: 'image/png'));

    final uri = await task.ref.getDownloadURL();

    final doc = FirebaseFirestore.instance.collection('post').doc();
    await doc.set({
      'id': doc.id,
      'photoUrl': uri.toString(),
      'contents': textEditingController.text,
      'email': widget.user.email,
      'displayName': widget.user.displayName,
      'userPhotoUrl': widget.user.photoURL
    });

    // 완료 후 앞 화면으로 이동
    Navigator.pop(context);
  }

  Widget _buildBody() {
    return _image == null ? Text('No Image') : Image.file(_image);
  }
}
