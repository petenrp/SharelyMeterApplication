import 'package:flutter/material.dart';
import 'package:sharelymeter/components/already_have_an_account_check.dart';
import 'package:sharelymeter/components/rounded_button.dart';
import 'package:sharelymeter/components/rounded_input_field.dart';
import 'package:sharelymeter/components/rounded_password_field.dart';
import 'package:sharelymeter/screens/login/login_screen.dart';
import 'package:sharelymeter/screens/signup/components/background.dart';
import 'package:sharelymeter/screens/signup/components/or_divider.dart';
import 'package:sharelymeter/screens/signup/components/social_icon.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Image.asset(
              "assets/images/signup.png",
              height: size.height * 0.25,
            ),
            RoundedInputField(
              hintText: "First Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last Name",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.email,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.02),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/line.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/apple.svg",
                  press: () {},
                ),
              ],
            ),
            //SizedBox(height: size.height * 0.01),
          ],
        ),
      ),
    );
  }
}
