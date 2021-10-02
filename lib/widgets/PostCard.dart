import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pierorolandoblog/helpers.dart';
import 'package:pierorolandoblog/pages/PostEditPage.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.imageUrl, required this.title, required this.subtitle, this.margin = 5, this.post
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String subtitle;
  final double margin;
  final dynamic post;

  @override
  Widget build(BuildContext context) {
    //print(post);
    return Container(
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
      ),
      height: 120,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Image.network(
            imageUrl, 
            fit: BoxFit.cover,
            alignment: Alignment.center,
            width: double.infinity,
          ),
          Container(height: double.infinity, width: double.infinity, color: Color.fromRGBO(17, 24, 39, 0.8),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: title,
                      child: Text(
                        title.length > 21 ? subStringText(title, 23): title,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)
                      ),
                    ),
                    Text(
                      subtitle.length > 49 ? subStringText(subtitle, 43) : subtitle, 
                      style: TextStyle(fontSize: 13, color: Colors.white70)
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => PostEditPage(title: title,))),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7)),
                          color: Color.fromRGBO(35, 95, 245, 1),
                        ),
                        padding: EdgeInsets.all(2.9),
                        child: Icon(CupertinoIcons.pencil, color: Colors.white, size: 19,)
                      ),
                    ),
                    SizedBox(width: 7),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Colors.red,
                      ),
                      padding: EdgeInsets.all(2.9),
                      child: Icon(CupertinoIcons.trash, color: Colors.white, size: 19,)
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
