import 'package:chat_app/constant.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_input_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

 static String id = 'registerPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 75,),
            Image.asset('assets/images/scholar.png',
            height: 100,
            ),
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
            const SizedBox(height: 75,),

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

            CustomInputText(hientText: 'Email'),
            const SizedBox(height: 20),
            CustomInputText(hientText: 'Password'),
            const SizedBox(height: 20),

            CustomButton(title: 'Register'),
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
    );
  }
}
