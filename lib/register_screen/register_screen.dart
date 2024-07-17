import 'package:flutter/material.dart';
import 'package:uiexam/constant/app_constant.dart';
import 'package:uiexam/login_screen/login_screen.dart';

String email = "";
String password = "";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    TextEditingController regEmailController = TextEditingController();
    TextEditingController regPassController = TextEditingController();
    TextEditingController regCpassController = TextEditingController();
    final emailFormkey = GlobalKey<FormState>();
    final passFormkey = GlobalKey<FormState>();
    final confirmpassFormkey = GlobalKey<FormState>();

    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(
      //     Icons.arrow_back,
      //     size: 35,
      //   ),
      // ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Sign UP for Free",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Form(
                  key: emailFormkey,
                  child: TextFormField(
                    validator: (value) {
                      var validEmail = emailValidatorRegExp.hasMatch(value!);
                      if (value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!validEmail) {
                        return 'Please enter valid Email';
                      } else {
                        return null;
                      }
                    },
                    controller: regEmailController,
                    decoration: InputDecoration(
                        hintText: 'Your Email Address',
                        hintStyle: TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: passFormkey,
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else {
                        return null;
                      }
                    },
                    controller: regPassController,
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: 'Your Password',
                        hintStyle: TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Form(
                  key: confirmpassFormkey,
                  child: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      } else if (value != regPassController.text) {
                        return 'password and confirm password not match';
                      } else {
                        return null;
                      }
                    },
                    controller: regCpassController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.visibility_off),
                        hintText: 'Your confirm Password',
                        hintStyle: TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    if (emailFormkey.currentState!.validate() &&
                        passFormkey.currentState!.validate() &&
                        confirmpassFormkey.currentState!.validate()) {
                      email = regEmailController.text;
                      password = regPassController.text;

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content:
                              Center(child: Text('Register successfull'))));

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 5, 54, 94)),
                    child: Center(
                        child: Text(
                      'Sign UP',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
                // Spacer(),
                SizedBox(
                  height: 280,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
