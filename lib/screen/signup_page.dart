import 'package:chat_app/components/Submit_buttom.dart';
import 'package:chat_app/components/chat_app_bar.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screen/chat_page.dart';
import 'package:chat_app/screen/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});
  static String id = "SignUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? email;

  String? password;

  bool isLaoding =false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall:isLaoding,
      child: Scaffold(
          body: Stack(
        children: [
          const ChatAppBar(
            appBarHeight: 260,
          ),
          Container(
            margin: const EdgeInsets.only(top: 210),
            height: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(40),
                topStart: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Sign UP",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      CustomTExtField(
                        obsecure: false,
                          onChanged: (data) {
                            email = data;
                          },
                          hintText: "Email"),
                      const SizedBox(
                        height: 40,
                      ),
                      CustomTExtField(
                        obsecure: true,
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: "Password"),
                      const SizedBox(
                        height: 30,
                      ),
                      SubmitButtom(
                        buttomFunction: "Sign Up",
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            isLaoding =true;
                            setState(() {
                              
                            });

                            try {
                              await registerUser();
                              showSnackBar(context, "success");
                              Navigator.pushNamed(context, ChatPage.id);
                            }
                            on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                showSnackBar(context, "Weak Password");
                              } else if (e.code == 'email-already-in-use') {
                                showSnackBar(context, "Email is Already Exist try to Sign in");
                              }
                            }
                            catch(e){
                              showSnackBar(context, e.toString());
                            }
                            isLaoding=false ;
                            setState(() {
                              
                            });
                            
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have Account ",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context, LoginPage.id
                                  );
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }

 

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
