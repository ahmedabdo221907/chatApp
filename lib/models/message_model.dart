import 'package:chat_app/helper/const.dart';

class MessageModel {
  final String message ;
   final String id ;
  MessageModel(this.message,this.id);

  factory MessageModel.fromJson (jsonData){
       //the name of feild=messages
    return MessageModel(jsonData [KMessage], jsonData['id']);
  }
}