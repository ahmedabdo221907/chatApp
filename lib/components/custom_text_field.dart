import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTExtField extends StatelessWidget {
 CustomTExtField({super.key,required this.hintText,this.onChanged,required this.obsecure});
final String? hintText;
Function(String)? onChanged;
final bool obsecure ;
  @override
  Widget build(BuildContext context) {
    return   TextFormField(
      obscureText: obsecure,
      validator: (data)
      {
        if (data!.isEmpty){
          return "field is Required ";
        }
        return null;
      },
      onChanged:onChanged ,
              decoration: InputDecoration(
                hintText:hintText ,
                focusedBorder: OutlineInputBorder(
                     borderRadius:BorderRadius.circular(15) ,
                  borderSide:const  BorderSide(
                    color: Color.fromARGB(255, 240, 120, 15),
                    width: 1,
                  )
                ),

                enabledBorder: OutlineInputBorder(
                  
                  borderRadius:BorderRadius.circular(15)   ,
                  borderSide:const  BorderSide(
                    color: Colors.grey,
                    width: 1,
                  )
                ),


              ),
            );
  }
}