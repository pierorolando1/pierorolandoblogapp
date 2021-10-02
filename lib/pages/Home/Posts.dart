import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pierorolandoblog/colors.dart';
import 'package:pierorolandoblog/widgets/PostCard.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final Stream<QuerySnapshot> _postsStream =
      FirebaseFirestore.instance.collection('posts').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Color.fromRGBO(17, 24, 39, 1),
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Color.fromRGBO(17, 24, 39, 1),
        middle: Text("Posts"),
      ),
      child: StreamBuilder(
        stream: _postsStream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: blue_600,
                strokeWidth: 2,
                backgroundColor: Colors.white10,
              )
            );
          }

          List<Widget> postsWidgets = snapshot.data!.docs.map<Widget>((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return PostCard(
              post: data,
              title: data["title"],
              subtitle: data["subtitle"],
              imageUrl: data["imagen"],
            );
          }).toList();

          return Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...postsWidgets,
                  SizedBox(height: 50)
                ]
              ),
            ),
          );
        },
      ),
    );
  }
}
