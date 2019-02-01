import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser _user;

  @override
  void initState() {
    super.initState();
    _auth.currentUser().then((user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return LoginPage();
    } else {
      return TabPage();
    }
  }
}
