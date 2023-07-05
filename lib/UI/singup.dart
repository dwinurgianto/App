import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:food_app/UI/rootpage.dart";
import "package:google_fonts/google_fonts.dart";

import "login.dart";

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpState();
}

class _SingUpState extends State<SingUpScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  TextEditingController _confirmpassTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Sing Up",
                      style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 12, 52, 36),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _emailTextController,
                        showCursor: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 52, 36).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _usernameTextController,
                        showCursor: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "User Name",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 52, 36).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _passTextController,
                        showCursor: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Create Password",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 52, 36).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _confirmpassTextController,
                        showCursor: false,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 52, 36).withOpacity(.1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              LoginSingUpButton(context, false, () {
                FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passTextController.text)
                    .then((value) {
                  print("Create New Account");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RootPage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              LogIn(),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                width: size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Or continue with",
                      style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 12, 52, 36),
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                width: size.width * .9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/facebook-logo.png",
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Image.asset(
                      "images/google-logo.png",
                      fit: BoxFit.cover,
                      height: 40,
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

  Row LogIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already Have any account?",
          style: GoogleFonts.montserrat(
            color: Color.fromARGB(255, 12, 52, 36).withOpacity(.8),
            fontSize: 14,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ));
          },
          child: Text(
            "Log In",
            style: GoogleFonts.montserrat(
              color: Color.fromARGB(255, 12, 52, 36),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
