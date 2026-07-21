import 'package:chat_app/constant.dart';
import 'package:chat_app/pages/regester_page.dart';
import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_input_text.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
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

            CustomInputText(hientText: 'Email'),
            const SizedBox(height: 20),
            CustomInputText(hientText: 'Password'),
           
            const SizedBox(height: 20),

            CustomButton(title: 'Login'),
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
    );
  }
}
