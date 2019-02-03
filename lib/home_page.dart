import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '𝔦𝔫𝔰𝔱𝔞𝔤𝔯𝔞𝔪 𝔠𝔩𝔬𝔫',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _buildListItem(context, index);
          }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.create),
          onPressed: () {
            print('눌림');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => CreatePage()));
          }),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    return InkWell(
      onTap: () => print(index),
      child: Column(
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
          Image.network(
              'https://cdn.pixabay.com/photo/2018/11/29/21/19/hamburg-3846525_1280.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                '어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구어쩌구 저쩌구'),
          ),
        ],
      ),
    );
  }
}
