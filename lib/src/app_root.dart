import 'package:chat_app/screen/chat_page.dart';
import 'package:chat_app/screen/login_page.dart';
import 'package:chat_app/screen/signup_page.dart';
import 'package:flutter/material.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: {
      LoginPage.id :(context) =>  LoginPage() ,
      SignUpPage.id :(context) =>  SignUpPage(),
      ChatPage.id: (context)=> ChatPage(),
     },
     initialRoute: LoginPage.id,
    );
  }
}