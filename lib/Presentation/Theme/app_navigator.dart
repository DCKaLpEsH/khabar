import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void push(BuildContext context, Widget widget) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      builder: (context) => widget,
    ),
  );
}

void pushReplacement(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context,
      CupertinoPageRoute(
        builder: (context) => widget,
      ));
}

void pop(BuildContext context) {
  Navigator.pop(context);
}
