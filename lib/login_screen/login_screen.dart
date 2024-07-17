import 'package:flutter/material.dart';
import 'package:uiexam/constant/app_constant.dart';
import 'package:uiexam/home_screen/home_screen.dart';
import 'package:uiexam/register_screen/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController loginEmailController = TextEditingController();
    TextEditingController loginPassController = TextEditingController();
    final _emailFormkey = GlobalKey<FormState>();
    final _passFormkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
          // leading: GestureDetector(
          //   onTap: () => Navigator.pop(context),
          //   child: Icon(
          //     Icons.arrow_back,
          //     size: 35,
          //   ),
          ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(18.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Sign in to Your Account",
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
                  key: _emailFormkey,
                  child: TextFormField(
                    validator: (value) {
                      final validEmail = emailValidatorRegExp.hasMatch(value!);
                      if (value.isEmpty) {
                        return "Please Enter Email";
                      } else if (!validEmail) {
                        return ' enter valid Email';
                      } else {
                        return null;
                      }
                    },
                    controller: loginEmailController,
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
                  key: _passFormkey,
                  child: TextFormField(
                    controller: loginPassController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 6) {
                        return 'password atleat 6 charactors';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: 'Your Password',
                        hintStyle: TextStyle(color: Colors.black87),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: true,
                          onChanged: (value) {},
                        ),
                        Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget Password',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ))
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    if (_emailFormkey.currentState!.validate() &&
                        _passFormkey.currentState!.validate()) {
                      if (loginEmailController.text == email &&
                          loginPassController.text == password) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.green,
                            content: Center(child: Text('Login successfull'))));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.red,
                            content: Center(
                                child: Text('incorrect email and password'))));
                      }
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
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
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
                                builder: (context) => RegisterScreen(),
                              ));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ))
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
