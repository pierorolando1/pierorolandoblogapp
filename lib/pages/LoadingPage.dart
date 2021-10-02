import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  validator() async {
    await Future.delayed(Duration(seconds: 2));
    FirebaseAuth.instance.userChanges().listen((User? user) {
      if (user == null) {
        Navigator.pushReplacementNamed(context, '/login');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  void initState() {
    validator();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 33, 47, 1),
      body: Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
