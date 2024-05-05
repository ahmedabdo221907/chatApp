import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SubmitButtom extends StatelessWidget {
   SubmitButtom({super.key,required this.buttomFunction,required this .onTap});
final String buttomFunction ;
 VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:onTap ,
      child: Container(
        alignment: Alignment.center,
        height: 47,
        width: 350,
        decoration: BoxDecoration(
          color:const  Color.fromARGB(255, 246, 133, 4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(buttomFunction,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
        
        ),
      ),
    );
  }
}