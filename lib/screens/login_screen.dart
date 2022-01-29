import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/singup_screen.dart';
import 'package:expense_tracker/widgets/bottom_text.dart';
import 'package:expense_tracker/widgets/flat_text_button.dart';
import 'package:expense_tracker/widgets/underlined_input_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              bottom: MediaQuery.of(context).viewPadding.bottom + 10),
          alignment: Alignment.center,
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome back!",
                  style: kColouredHeadline,
                ),
                const SizedBox(height: 20.0),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Login",
                    style: kHeadline,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  "E-mail",
                  style: kTitleTextStyle,
                ),
                const SizedBox(height: 10.0),
                UnderLinedInputField(
                  controller: usernameController,
                  hintText: 'Your e-mail here',
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Password",
                  style: kTitleTextStyle,
                ),
                const SizedBox(height: 10.0),
                UnderLinedInputField(
                  controller: passwordController,
                  hintText: 'Your password here',
                  hideText: true,
                ),
                const SizedBox(height: 50.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FlatTextButton(
                      title: "Login",
                      onClick: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignupScreen();
                        }));
                      }),
                ),
                const SizedBox(height: 20.0),
                BottomText(
                  title: "Don't have an account yet?",
                  text: "Sign Up",
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignupScreen();
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
