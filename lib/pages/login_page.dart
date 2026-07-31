import 'package:chat_app/constant.dart';
import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/pages/regester_page.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_input_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  GlobalKey<FormState> formKey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),

          child: Form(
            key: formKey,
            child: ListView(
              //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 75),
                Image.asset('assets/images/scholar.png', height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'pacifico',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 75),
                Row(
                  children: [
                    Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'pacifico',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                CustomInputText(
                  hientText: 'Email',

                  onChange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 20),
                CustomInputText(
                  hientText: 'Password',

                  onChange: (data) {
                    password = data;
                  },
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});

                      try {
                        await loginUser();
                        showSnackBar(context, 'Success');
                      }
                      // safe print in case displayName is null
                      on FirebaseAuthException catch (ex) {
                        if (ex.code == 'user-not-found') {
                          showSnackBar(
                            context,
                            'No user found for that email.',
                          );
                        } else if (ex.code == 'wrong-password') {
                          showSnackBar(
                            context,
                            'Wrong password provided for that user.',
                          );
                        }
                      } catch (ex) {
                        print(ex);
                        showSnackBar(context, 'There Was Error');
                      }
                      isLoading = false;

                      setState(() {});
                    }
                  },

                  child: CustomButton(title: 'Login'),
                ),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'dont have an account?',
                      style: TextStyle(color: Colors.white),
                    ),

                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, RegisterPage.id);
                      },

                      child: Text(
                        '   Register',
                        style: TextStyle(color: Color(0xffc7ede6)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<UserCredential> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return user;
  }
}
