import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String Message) {
    ScaffoldMessenger.of(context)
        .showSnackBar( SnackBar(content: Text(Message)
        )
        );
  }