import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/homepage.dart';
import 'package:expense_tracker/screens/singup_screen.dart';
import 'package:expense_tracker/widgets/round_button.dart';
import 'package:expense_tracker/widgets/underlined_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Log In",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              "Username",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 10.0),
            UnderLinedInputField(
              controller: usernameController,
              hintText: 'Eg. ironman01',
            ),
            const SizedBox(height: 30.0),
            const Text(
              "Password",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 10.0),
            UnderLinedInputField(
              controller: passwordController,
              hideText: true,
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButton(
                    title: "Sign Up",
                    isSelected: false,
                    onClick: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupScreen();
                      }));
                    }),
                RoundButton(
                    title: "Continue",
                    isSelected: false,
                    onClick: () {
                      // we will add the conditions after you integrate the data base
                      // for now I am navigating to profile screen
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage(username: usernameController.text);
                      }));
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
