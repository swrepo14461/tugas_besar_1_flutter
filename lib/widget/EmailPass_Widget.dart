import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ui/produk/prod_index.dart';
import 'FailLogin_Widget.dart';

class EmailPass extends StatefulWidget {
  const EmailPass({Key? key}) : super(key: key);

  @override
  State<EmailPass> createState() => _EmailPass();
}

class _EmailPass extends State<EmailPass> {
  bool obscurePass = true;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          userNameField(),
          const SizedBox(height: 18),
          passwordField(),
          const SizedBox(height: 18),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() == true) {
                    if (userNameController.value.text == "41522120020" &&
                        passwordController.value.text == "0020") {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const ProdIndex()));
                    } else {
                      showDialog(context: context, builder: (BuildContext context) {
                        return const FailLoginDialog();
                      });
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 18),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white
                ),
                child: const Text("Login")),
          )
        ],
      ),
    );
  }

  Widget userNameField() {
    return Column(
      children: [
        TextFormField(
          controller: userNameController,
          decoration: const InputDecoration(
            hintText: "NIM"
          ),
          validator: (value) {
            var nim = (value ?? "").trim();

            if (nim.isEmpty) {
              return "Please enter an NIM";
            } else {
              bool  isNumeric = RegExp(r'^\d+$').hasMatch(nim);
              if (!isNumeric) {
                return "NIM should contain numbers only.";
              }
            }
            return null;
          },
        )
      ],
    );
  }

  Widget passwordField() {
    return Column(
      children: [
        TextFormField(
          obscureText: obscurePass,
          controller: passwordController,
          decoration: InputDecoration(
            hintText: "Password",
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  if (obscurePass) {
                    obscurePass = false;
                  } else {
                    obscurePass = true;
                  }
                });
              },
              child: Icon(
                  obscurePass
                  ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined
              ),
            )
          ),
          validator: (value) {
            var pass = (value ?? "").trim();

            if(pass.isEmpty){
              return "Please enter a valid password";
            }
            return null;
          },
        )
      ],
    );
  }
}