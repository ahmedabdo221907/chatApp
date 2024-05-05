import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  ChatCard({
    required this.messageInput
   , super.key,
  });
final MessageModel messageInput ;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
         margin:const  EdgeInsets.symmetric(horizontal:  16, vertical: 8),
        padding: const EdgeInsets.only(left: 15,top: 17,bottom: 17,right:17),
        decoration: const BoxDecoration(
         color: Color.fromARGB(255, 246, 133, 4),
         borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topRight: Radius.circular(10),
      
         )
        ),
        child:  Text(messageInput.message),
      ),
    );
  }
}




class ChatCardForFriend extends StatelessWidget {
  ChatCardForFriend({
    required this.messageInput
   , super.key,

  });
final MessageModel messageInput ;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
         margin:const  EdgeInsets.symmetric(horizontal:  16, vertical: 8),
        padding: const EdgeInsets.only(right: 15,bottom: 17,top: 17,left:17),
        decoration: const BoxDecoration(
         color: Color.fromARGB(255, 242, 246, 4),
         borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomLeft: Radius.circular(10),
      
         )
        ),
        child:  Text(messageInput.message),
      ),
    );
  }
}