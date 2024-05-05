import 'package:chat_app/components/Submit_buttom.dart';
import 'package:chat_app/components/chat_app_bar.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:chat_app/components/sign_platform.dart';
import 'package:chat_app/components/try_to_signup_text.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/screen/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_text_line/horizontal_text_line.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String id = "LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email, password;

  bool isLaoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLaoding,
      child: Scaffold(
          body: Stack(
        clipBehavior: Clip.none,
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
              padding: const EdgeInsets.all(28),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Sign in",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 55,
                      ),
                      CustomTExtField(
                        obsecure: false,
                        onChanged: (data) {
                          email = data;
                        },
                        hintText: "Email",
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      CustomTExtField(
                        obsecure: true,
                          onChanged: (data) {
                            password = data;
                          },
                          hintText: "Passowrd "),
                      const SizedBox(
                        height: 20,
                      ),

                      //SubmitButtom
                      SubmitButtom(
                          onTap: () async {
                            if (formKey.currentState!.validate()) {
                              isLaoding = true;
                              setState(() {});
                              try {
                                await userLogin();
                                showSnackBar(context, "Successs");
                                Navigator.pushNamed(context, ChatPage.id,arguments: email);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  showSnackBar(context, "User not found ");
                                } else if (e.code == 'wrong-password') {
                                  showSnackBar(context, "Wrong Passowrd");
                                }
                              } catch (e) {
                                showSnackBar(context, e.toString());
                              }
                              isLaoding = false;
                              setState(() {});
                            }
                          },
                          buttomFunction: "Login"),

                      const SizedBox(
                        height: 20,
                      ),

                      const TryToSignUpText(),

                      const SizedBox(height: 20),
                      const HorizontalTextLine(
                          text: "or", color: Colors.brown, height: 2.5),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SignPlatform(img: "lib/assets/google.png"),
                          SizedBox(
                            width: 50,
                          ),
                          SignPlatform(img: "lib/assets/facebook.jpeg")
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const Text(
                        "اهلا بكم فى مجتمع الحوارات علشان الحوارات كترا",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
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

  Future<void> userLogin() async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
