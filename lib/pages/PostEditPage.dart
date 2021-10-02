import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pierorolandoblog/helpers.dart';

class PostEditPage extends StatelessWidget {
  const PostEditPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    //final routes = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Posts",
        middle: Text(title.length > 15 ? subStringText(title, 15) : title),
      ),
      child: Center(
        child: Hero(
          tag: title,
          child: Text(title)
        ),
      ),
    );
  }
}
