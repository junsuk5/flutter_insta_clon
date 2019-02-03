import 'package:flutter/material.dart';

class DetailPostPage extends StatefulWidget {
  final String tag;

  DetailPostPage({Key key, this.tag}) : super(key: key);

  @override
  _DetailPostPageState createState() => _DetailPostPageState();
}

class _DetailPostPageState extends State<DetailPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('둘러보기'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2018/11/29/21/19/hamburg-3846525_1280.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'a811219@gmail.com',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('오준석'),
                  ],
                ),
              )
            ],
          ),
        ),
        Hero(
          tag: widget.tag,
          child: Image.network(
              'https://cdn.pixabay.com/photo/2018/11/29/21/19/hamburg-3846525_1280.jpg'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
              '어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구'),
        ),
      ],
    );
  }
}
