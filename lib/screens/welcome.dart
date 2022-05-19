import 'package:boj/components/buttons.dart';
import 'package:boj/constants/colors.dart';
import 'package:boj/screens/login.dart';
import 'package:boj/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/svg/feeed.svg',
                  height: size.height * 0.38,
                ),
                const Text("Welcome BOJ!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: size.height * 0.01,
                ),
                const Text(
                  "Karibu ujifunze neno la Mungu!",
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                Button(
                    text: "Login",
                    textColor: Colors.white,
                    backgroundColor: kLightBlue,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Button(
                    text: "Create Account",
                    textColor: Colors.white,
                    backgroundColor: kDarkTeal,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Signup()));
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
