import 'package:flutter/material.dart';

import '../widget/EmailPass_Widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30, bottom: 15, top: 5),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Tugas Besar 1",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10),
                  Image(image: AssetImage('assets/images/mercubuana_logo.png')),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Login', style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700
                        )),
                        SizedBox(height: 10),
                        Text("Login To Continue Using The App",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  EmailPass()
                ],
              ),
            ),
          )
      ),
    );
  }
}
