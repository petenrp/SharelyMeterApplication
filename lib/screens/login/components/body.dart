import 'package:flutter/material.dart';
import 'package:sharelymeter/components/already_have_an_account_check.dart';
import 'package:sharelymeter/components/rounded_button.dart';
import 'package:sharelymeter/components/rounded_input_field.dart';
import 'package:sharelymeter/components/rounded_password_field.dart';
import 'package:sharelymeter/screens/login/components/background.dart';
import 'package:sharelymeter/screens/signup/signup_screen.dart';
import 'package:sharelymeter/service/auth.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final AuthService _auth = AuthService();

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Image.asset(
                "assets/images/login.png",
                height : size.height * 0.35,
              ),
              RoundedInputField(
                hintText: "Email",
                icon: Icons.email,
                onChanged: (value){
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value){
                  setState(() {
                    password = value;
                  });
                },
                hinttext: "Password",
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  print(email);
                  print(password);
                },
              ),
              SizedBox(height: size.height * 0.02),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  } 
}

