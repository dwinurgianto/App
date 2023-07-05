import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                padding: EdgeInsets.all(16.0),
              ),
              Image.asset(
                "images/logo.png",
                width: 210,
              ),
              SizedBox(height: 20),
              // Text(
              //   "Selamat Datang",
              //   style: GoogleFonts.montserrat(
              //     color: Color.fromARGB(255, 12, 52, 36),
              //     textStyle: Theme.of(context)
              //         .textTheme
              //         .headlineSmall!
              //         .copyWith(fontWeight: FontWeight.bold),
              //   ),
              // ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: TextField(
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: "Email",
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
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(
                      child: TextField(
                        obscureText: true,
                        showCursor: false,
                        decoration: InputDecoration(
                          hintText: "Password",
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
                height: 20,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            color: Color.fromARGB(255, 255, 255, 255),
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(fontWeight: FontWeight.w400)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 12, 52, 36),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don’t Have any account?",
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 12, 52, 36).withOpacity(.8),
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    "Sing Up",
                    style: GoogleFonts.montserrat(
                      color: Color.fromARGB(255, 12, 52, 36),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
