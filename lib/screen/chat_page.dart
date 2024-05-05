import 'package:chat_app/components/chat_app_bar.dart';
import 'package:chat_app/components/chat_card.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = "ChatPage";

//fireStroe
  CollectionReference messag =FirebaseFirestore.instance.collection('Messages');
  TextEditingController controller = TextEditingController();
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
   String? email= ModalRoute.of(context)!.settings.arguments.toString();
    return StreamBuilder<QuerySnapshot>(
        stream: messag.orderBy("createdAt", descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messageList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messageList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }

            return Scaffold(
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 246, 133, 4),
                automaticallyImplyLeading: false,
                title: const ChatAppBar(appBarHeight: 90),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messageList.length,
                      itemBuilder: (context, index) {
                        return  messageList[index].id==email? 
                          ChatCard(messageInput: messageList[index],)
                         :ChatCardForFriend(messageInput: messageList[index]);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (data) {
                        messag.add(
                            {
                              "messages": data,
                               "createdAt": DateTime.now(),
                               "id":email,
                               });
                        controller.clear();
                        _controller.animateTo(
                          // _controller.position.maxScrollExtent=0,
                          0,
                          curve: Curves.fastOutSlowIn,
                          duration: const Duration(seconds: 1),
                          
                        );
                      },
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          hintText: "Send message",
                          suffixIcon: const Icon(
                            Icons.send,
                            color: Colors.orangeAccent,
                          ),
                          enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              style: BorderStyle.solid,
                              width: 1.5,
                              color: Color.fromARGB(255, 236, 120, 5),
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.deepOrangeAccent,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          )),
                    ),
                  )
                ],
              ),
            );
          } else {
            return Text("isLaoding");
          }
        });
  }
}
