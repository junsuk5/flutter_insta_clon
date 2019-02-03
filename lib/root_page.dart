import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clon/loading_page.dart';

import 'login_page.dart';
import 'tab_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return _handleCurrentScreen();
  }

  Widget _handleCurrentScreen() {
    return new StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingPage();
        } else {
          if (snapshot.hasData) {
            return TabPage();
          }
          return LoginPage();
        }
      },
    );
  }
}
