import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:food_app/UI/rootpage.dart";
import "package:food_app/UI/singup.dart";
import "package:google_fonts/google_fonts.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static String routeName = "LoginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/logo.png",
                width: 210,
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                width: size.width * .9,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Login to your account",
                      style: GoogleFonts.montserrat(
                        color: Color.fromARGB(255, 12, 52, 36),
                        textStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
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
                        controller: _emailTextController,
                        showCursor: false,
                        keyboardType: TextInputType.emailAddress,
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
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
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
                height: 10,
              ),
              LoginSingUpButton(context, true, () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passTextController.text)
                    .then((value) {
                  print("Login Successful");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RootPage()));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              }),
              SingUp(),
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
                padding: EdgeInsets.symmetric(horizontal: 16.0),
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

  Row SingUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t Have any account?",
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
                  builder: (context) => SingUpScreen(),
                ));
          },
          child: Text(
            "Sing Up",
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

Container LoginSingUpButton(
    BuildContext context, bool isLogin, Function onTap) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width * .9,
    height: 78,
    padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      child: Text(
        isLogin ? "Log In" : "SingUp",
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return Colors.white10;
            }
            return Color.fromARGB(255, 12, 52, 36);
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
    ),
  );
}
