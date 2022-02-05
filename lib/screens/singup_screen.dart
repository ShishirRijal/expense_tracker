import 'package:expense_tracker/constant.dart';
import 'package:expense_tracker/screens/homepage.dart';
import 'package:expense_tracker/screens/login_screen.dart';
import 'package:expense_tracker/widgets/bottom_text.dart';
import 'package:expense_tracker/widgets/flat_text_button.dart';
import 'package:expense_tracker/widgets/underlined_input_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  bottom: MediaQuery.of(context).viewPadding.bottom + 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Welcome To\nExpense Tracker!",
                    style: kColouredHeadline,
                  ),
                  const SizedBox(height: 20.0),
                  const Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      "Sign Up",
                      style: kHeadline,
                    ),
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
                  const SizedBox(height: 20.0),
                  const Text(
                    "Email",
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(height: 10.0),
                  UnderLinedInputField(
                    controller: emailController,
                    hintText: 'Eg.expense@gmail.com',
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    "Password",
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(height: 10.0),
                  UnderLinedInputField(
                    controller: passwordController,
                    hintText: 'Create a strong password',
                    hideText: true,
                  ),
                  const SizedBox(height: 50.0),
                  FlatTextButton(
                      title: "Sign Up",
                      onClick: () async {
                        // we will add the conditions after you integrate the data base
                        // for now I am navigating to profile screen
                        final fullName = nameController.text.trim();
                        final firstName = fullName.split(" ").first;
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        try {
                          await Firebase.initializeApp();

                          await _auth
                              .createUserWithEmailAndPassword(
                                  email: email, password: password)
                              .then(
                                (value) => {
                                  if (value.user != null)
                                    {
                                      FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(value.user?.uid)
                                          .set({
                                        'firstName': firstName,
                                        'lastName': fullName.split(" ").last,
                                        'email': email,
                                        'uid': value.user?.uid,
                                      }),
                                    },
                                  if (value.user != null)
                                    {
                                      Navigator.pushReplacement(context,
                                          MaterialPageRoute(builder: (context) {
                                        return HomePage(username: firstName);
                                      })),
                                    }
                                },
                              );
                        } catch (e) {
                          // print(e);
                        }
                      }),
                  const SizedBox(height: 20.0),
                  BottomText(
                      title: "Already have an account?",
                      text: "Login",
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






// var ref = new Firebase("https://<YOUR-FIREBASE-APP>.firebaseio.com");
// ref.createUser({
//   email    : emailAddress,
//   password : password
// }, function(error, authData) {
//   if (error) {
//     console.log("Error creating user:", error);
//   } else {
//     // save the user's profile into the database so we can list users,
//     // use them in Security and Firebase Rules, and show profiles
//     ref.child("users").child(authData.uid).set({
//       provider: authData.provider,
//       name: userName
//     });
//   }
// });