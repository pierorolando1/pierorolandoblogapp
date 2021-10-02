import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pierorolandoblog/pages/Home/NewPost.dart';
import 'package:pierorolandoblog/pages/Home/Posts.dart';
import 'package:pierorolandoblog/pages/Home/Profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return CupertinoTabScaffold(
      backgroundColor: Color.fromRGBO(17, 24, 39, 1),
      tabBar: CupertinoTabBar(
        backgroundColor: Color.fromRGBO(31, 41, 55, 0.7),//Color.fromRGBO(17, 24, 39, 0.7),
        items: [
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.home, size: 24,)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.add)),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.person, size: 24,))
        ]
      ),
      tabBuilder: (context, index){ 
        return CupertinoTabView(
          builder: (context) {
            //print(index);
            switch (index) {
              case 0:
                return PostsPage();
              case 1:
                return NewPostPage();
              case 2:
                return ProfilePage();
              default:
                return PostsPage();
            }
          },
        );
      },
    );
  }
}