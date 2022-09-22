import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/pages/screen/login_page.dart';
import '../../theme/colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
              'Create new account',
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
              'Please fill in the form to continue',
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
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email Address',
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
                    Icons.mail,
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
                      obscureText: false,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
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
                    Icons.phone_iphone,
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
                      onPressed: (){}, 
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
                  SizedBox(height: 10,),
                  TextButton(
                    onPressed: () {
                      // Navigator.push(context, 
                      // MaterialPageRoute(builder: (build) => SignUpPage()),
                      // );
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage())
                      );
                    }, 
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: 'Have an account? ',
                            style:TextStyle(
                              color: white,
                              fontSize: 17,
                              
                            ),
                          ),
                          TextSpan(
                            text: ' Sign in',
                            style: TextStyle(
                              color: white,
                              fontSize: 17,
                              letterSpacing: 1.5,
                          ),
                        ),
                      ]),
                    ),
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