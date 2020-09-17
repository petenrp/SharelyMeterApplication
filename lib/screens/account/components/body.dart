import 'package:flutter/material.dart';
import 'info.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "Jaehyun Jeong",
            email: "_jeongjaehyun@gmail.com",
          ),
        ],
      ),
    );
  }
}
