import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

showCupeDialog(BuildContext context, String title) {
  CupertinoAlertDialog alert = CupertinoAlertDialog(
    title: Text(title),
    actions: [
      CupertinoDialogAction(
        child: Text('OK'),
        onPressed: () {
          print("ok");
          Navigator.pop(context);
        },
      ),
    ],
  );

  return showCupertinoDialog(
    context: context,
    barrierDismissible: true,
    useRootNavigator: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


String subStringText(String text, int finalLenght){
  return text.substring(0, finalLenght) + "...";
}