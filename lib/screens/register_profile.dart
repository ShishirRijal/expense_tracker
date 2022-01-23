import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/homepage.dart';
import 'package:expense_tracker/widgets/round_button.dart';
import 'package:expense_tracker/widgets/underlined_input_field.dart';
import 'package:flutter/material.dart';

class RegisterProfile extends StatelessWidget {
  RegisterProfile({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
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
              "Full Name",
              style: kTitleTextStyle,
            ),
            const SizedBox(height: 10.0),
            UnderLinedInputField(
              controller: nameController,
              hintText: 'Eg. Tony Stark',
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
            Align(
              alignment: Alignment.bottomRight,
              child: RoundButton(
                title: "Continue",
                isSelected: false,
                onClick: () {
                  // we will add the conditions after you integrate the data base
                  // for now I am navigating to profile screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage(username: usernameController.text);
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
