import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key,required this.appBarHeight});
final double appBarHeight ;
  @override
  Widget build(BuildContext context) {
    return Container( 
    height:appBarHeight,
    width: double.infinity,
    decoration:const BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20)
      ),
      color: const Color.fromARGB(255, 246, 133, 4)
    ) ,
    child: const Center(
      child:  Text(" chaty ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
      
          ),),
    ),
    
  );
  }
}