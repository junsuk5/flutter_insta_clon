import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage(this.user, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Instagram Clone',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Instagram에 오신 것을 환영합니다',
                  style: TextStyle(fontSize: 24.0),
                ),
                const Padding(padding: EdgeInsets.all(8.0)),
                const Text('사진과 동영상을 보려면 팔로우하세요.'),
                const Padding(padding: EdgeInsets.all(16.0)),
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
                              backgroundImage:
                                  NetworkImage(widget.user.photoURL!),
                            ),
                          ),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          Text(
                            widget.user.email!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(widget.user.displayName!),
                          const Padding(padding: EdgeInsets.all(8.0)),
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
                              const Padding(
                                padding: EdgeInsets.all(1.0),
                              ),
                              SizedBox(
                                width: 70.0,
                                height: 70.0,
                                child: Image.network(
                                    'https://cdn.pixabay.com/photo/2017/06/21/05/42/fog-2426131_1280.jpg',
                                    fit: BoxFit.cover),
                              ),
                              const Padding(
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
                          const Padding(padding: EdgeInsets.all(4.0)),
                          const Text('Facebook 친구'),
                          const Padding(padding: EdgeInsets.all(4.0)),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                                textStyle: const TextStyle(color: Colors.white),
                              ),
                              child: const Text('팔로우'),
                              onPressed: () => print('팔로우 클릭')),
                          const Padding(padding: EdgeInsets.all(4.0))
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
