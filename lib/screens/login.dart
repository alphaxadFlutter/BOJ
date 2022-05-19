import 'package:boj/screens/privacy.dart';
import 'package:boj/screens/signup.dart';
import 'package:boj/screens/terms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/buttons.dart';
import '../components/textfields.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String id = '/login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phone = TextEditingController();
  bool step1 = true;
  bool step2 = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
            child: Form(
              child: Column(
                children: [
                  SvgPicture.asset(
                    'assets/svg/signup.svg',
                    height: size.height * 0.38,
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  const Text(
                    "Kua wa kwanza kupata taarifa za dini!",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      TextInputs(
                          type: TextInputType.phone,
                          hint: "Phone Number",
                          labelname: "Phone number",
                          prefix: Icons.phone,
                          onChanged: (value) {},
                          controller: phone,
                          validate: (value) {
                            return null;
                          },
                          prefixWord: "+255"),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Button(
                          text: "Finish",
                          textColor: Colors.white,
                          backgroundColor: Colors.lightBlueAccent,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const BOJHome()));
                          }),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Have No Account ? ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                          InkWell(
                            child: const Text("Signup here! ",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.lightBlueAccent,
                                    decoration: TextDecoration.underline)),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const Signup()));
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
