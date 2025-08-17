import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/screens/username_screen.dart';
import 'package:tik_tok/screens/login_screen.dart';
import 'package:tik_tok/widgets/auth_button.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      )
    );
  }

  void onStartWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => UserNameScreen(),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Gaps.v100,
              const Text(
                "Sign up to TikTok",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700
                  ),
              ),
              Gaps.v20,
              Text(
                  textAlign: TextAlign.center,
                  "Create a profile, follow other accounts, make your own videos, and more.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[700],
                  ),
              ),
              Gaps.v40,
              GestureDetector(
                onTap: () => onStartWithEmail(context),
                child: AuthButton(
                  icon: FaIcon(FontAwesomeIcons.solidUser),
                  text: "Start with phone or email"
                  ),
              ),
              Gaps.v20,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.google),
                text: "Continue with Google"
                ),
              Gaps.v20,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.facebook),
                text: "Continue with Facebook"
              ),
              Gaps.v20,
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.twitter),
                text: "Continue with Apple"
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.grey.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account?"),
            Gaps.h5,
            GestureDetector(
              onTap: () => onLoginTap(context),
              child: Text(
                "Log in", 
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 