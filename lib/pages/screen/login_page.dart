import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/pages/screen/route_page.dart';
import 'package:flutter_app_spotify/pages/screen/sign_up_page.dart';
import '../../theme/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Welcome Back!',
              style: TextStyle(
                color: white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Please sign in to your account',
              style: TextStyle(
                color: grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: blackTextFild,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 270.0,
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      style: TextStyle(
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.account_circle,
                    color: grey,
                  )
                ],
              ),
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              margin: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              decoration: BoxDecoration(
                color: blackTextFild,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 270.0,
                    child: const TextField(
                      textAlignVertical: TextAlignVertical.center,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontSize: 17,
                          color: grey,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      style: TextStyle(
                        color: white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.visibility_off,
                    color: grey,
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 80),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(390, 70),
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (build) => RoutePage()),
                      );
                      }, 
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: white,
                          fontSize: 22,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, 
                      // MaterialPageRoute(builder: (build) => SignUpPage()),
                      // );
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SignUpPage())
                      );
                    }, 
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style:TextStyle(
                              color: white,
                              fontSize: 17,
                              
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                              letterSpacing: 1.5,
                          ),
                        ),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  RichText(text: const TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                      color: grey,
                      fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Socialicon(
                        iconsrc: "assets/icons/facebook.png",
                        press: (){},
                      ),
                      Socialicon(
                        iconsrc: "assets/icons/google.png",
                        press: (){},
                      ),
                      Socialicon(
                        iconsrc: "assets/icons/instagram.png",
                        press: (){},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class Socialicon extends StatelessWidget {
  final String iconsrc;
  final VoidCallback press;

  const Socialicon({
    Key? key, required this.iconsrc, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: black,
          ),
          shape: BoxShape.circle,
        ),
      child: Image.asset(iconsrc, width: 35, height: 35),
      ),
    );
  }
}

