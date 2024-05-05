import 'package:flutter/material.dart';

class SignPlatform extends StatelessWidget {
  const SignPlatform({super.key, this.img});
 final String ? img;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage : AssetImage(img!),
    );
  }
}