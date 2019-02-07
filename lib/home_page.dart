import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/create_page.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;

  HomePage(this.user);

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
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram에 오신 것을 환영합니다',
              style: TextStyle(fontSize: 24.0),
            ),
            Padding(padding: EdgeInsets.all(8.0)),
            Text('사진과 동영상을 보려면 팔로우하세요.'),
            Padding(padding: EdgeInsets.all(16.0)),
            SizedBox(
              width: 260.0,
              child: Card(
                elevation: 4.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(widget.user.photoUrl),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Text(
                        widget.user.email,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(widget.user.displayName),
                      Padding(padding: EdgeInsets.all(8.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/09/21/19/12/france-2773030_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                          ),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2017/06/21/05/42/fog-2426131_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.all(1.0),
                          ),
                          SizedBox(
                            width: 70.0,
                            height: 70.0,
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2019/02/04/20/07/flowers-3975556_1280.jpg',
                                fit: BoxFit.cover),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(4.0)),
                      Text('Facebook 친구'),
                      Padding(padding: EdgeInsets.all(4.0)),
                      RaisedButton(
                          color: Colors.blueAccent,
                          textColor: Colors.white,
                          child: Text('팔로우'),
                          onPressed: () => print('팔로우 클릭')),
                      Padding(padding: EdgeInsets.all(4.0))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
