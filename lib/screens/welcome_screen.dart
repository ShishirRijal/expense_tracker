import 'package:expense_tracker/screens/homepage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String? username;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "WELCOME TO",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "EXPENSE TRACKER",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 150.0,
            ),
            TextField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.deepOrange,
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "Your Name Here",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onChanged: (newValue) {
                username = newValue;
              },
              onSubmitted: (_) {
                if (username == null) {
                  return;
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage(
                    username: username!,
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
