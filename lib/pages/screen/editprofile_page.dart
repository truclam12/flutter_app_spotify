import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_app_spotify/theme/colors.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: black,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 20, color: white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 5, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          border: Border.all(width: 4, color: grey),
                          boxShadow: const [
                            BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: bgrey,
                              offset: Offset(0, 8),
                            )
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage("assets/images/img_8.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: primary,
                            ),
                            color: primary,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 35),
              buildTextField("Username", "truclam12",false),
              const SizedBox(height: 35),
              buildTextField("Full Name", "NTTL",false),
              const SizedBox(height: 35),
              buildTextField("E-mail", "truclam12@gmail.com",false),
              const SizedBox(height: 35),
              buildTextField("Password", "*********",true),
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(140, 65),
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: primary,
                          fontSize: 20,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        fixedSize: const Size(140, 65),
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: (){}, 
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: white,
                          fontSize: 20,
                          letterSpacing: 2.2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextField(
      String labelText, String placeholder, isPasswordTextField) {
    return TextFormField(
      obscureText: isPasswordTextField ? showPassword : false,
      decoration: InputDecoration(
        suffixIcon: isPasswordTextField ? IconButton(
          onPressed: (){
            setState(() {
              showPassword = !showPassword;
            });
          },
          icon: const Icon(Icons.remove_red_eye),
          color: grey,
        ) : null,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: grey),
        ),
        contentPadding: const EdgeInsets.only(bottom: 3),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: primary,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 21,
          color: white,
        ),
      ),
      style: const TextStyle(color: white),
    );
  }
}
