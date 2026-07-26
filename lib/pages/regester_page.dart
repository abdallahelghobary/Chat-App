import 'package:chat_app/constant.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_input_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, this.email, this.password});

  static String id = 'registerPage';
  String? email;
  String? password;

  GlobalKey<FormState> formKey =GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key:formKey ,
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
                    'REGISTER',
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
                onChange: (data) {
                  email = data;
                },
          
                hientText: 'Email',
              ),
              const SizedBox(height: 20),
              CustomInputText(
                onChange: (data) {
                  password = data;
                },
                hientText: 'Password',
              ),
              const SizedBox(height: 20),
          
              GestureDetector(
                onTap: () async {
                  try {
                    var user = await registerUser();
                  }
                  // safe print in case displayName is null
                  on FirebaseAuthException catch (ex) {
                    if (ex.code == 'week-password') {
                      showSnackBar(context, 'Week Password');
                    } else if (ex.code == 'email-already-in-use') {
                      showSnackBar(context, 'Email Already Is Exit');
                    }
                    showSnackBar(context, 'Success');
                  }  catch (ex)
                  {
                                      showSnackBar(context, 'There Was Error');
          
                  }
          
                },
                child: CustomButton(title: 'Register'),
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
                      Navigator.pop(context);
                    },
                    child: Text(
                      '  Login',
                      style: TextStyle(color: Color(0xffc7ede6), fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.purple),
    );
  }

  Future<UserCredential> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
    return user;
  }
}
