import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/screens/register_profile.dart';
import 'package:expense_tracker/widgets/round_button.dart';
import 'package:expense_tracker/widgets/underlined_input_field.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50.0),
            const Text(
              "Email",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 10.0),
            UnderLinedInputField(
              controller: emailController,
              hintText: 'Eg.expense@gmail.com',
            ),
            const SizedBox(height: 30.0),
            const Text(
              "OTP",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 10.0),
            UnderLinedInputField(controller: otpController),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RoundButton(
                    title: "Log In",
                    isSelected: false,
                    onClick: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginScreen();
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
                        return RegisterProfile();
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
