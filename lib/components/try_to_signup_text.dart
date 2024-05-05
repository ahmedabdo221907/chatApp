import 'package:chat_app/screen/signup_page.dart';
import 'package:flutter/material.dart';

class TryToSignUpText extends StatelessWidget {
  const TryToSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                         const  Text("Don`t have Account ? ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                           
                          ),),

                          //clicable
                         InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SignUpPage.id);
                            },
                            child: const Text("  Sign Up ",
                             style: TextStyle(
                              color: Colors.orange,
                              fontSize: 15,fontWeight: FontWeight.bold
                             ),),
                          )
            ],
            );
  }
}