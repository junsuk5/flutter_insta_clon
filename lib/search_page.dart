import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/detail_post_page.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text(
        '𝔦𝔫𝔰𝔱𝔞𝔤𝔯𝔞𝔪 𝔠𝔩𝔬𝔫',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBody() {
    return StreamBuilder(
        stream: Firestore.instance.collection('post').snapshots(),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var items = snapshot.data?.documents ?? [];

          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(context, items[index]);
              });
        });
  }

  Widget _buildListItem(context, document) {
    return Hero(
      tag: document['photoUrl'],
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return DetailPostPage(document: document);
            }));
          },
          child: Image.network(
            document['photoUrl'],
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
