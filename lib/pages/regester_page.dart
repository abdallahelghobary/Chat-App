import 'package:chat_app/widget/custom_button.dart';
import 'package:chat_app/widget/custom_input_text.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b475e),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          //  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Image.asset('assets/images/scholar.png'),
            Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 32,
                fontFamily: 'pacifico',
                color: Colors.white,
              ),
            ),
            Spacer(flex: 1),

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
            const SizedBox(height: 18),
            CustomInputText(hientText: 'Password'),
            const SizedBox(height: 18),

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
                    style: TextStyle(color: Color(0xff156398),fontSize: 16),
                  ),
                ),
              ],
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
