import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/features/authentication/widgets/auth_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';  

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void onSignUpTap(BuildContext context) {
    Navigator.of(context).pop();
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
                "Log in to TikTok",
                style: TextStyle(
                  fontSize: 24,
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
              AuthButton(
                icon: FaIcon(FontAwesomeIcons.solidUser),
                text: "Use ID with Password"
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
                icon: FaIcon(FontAwesomeIcons.apple),
                text: "Continue with Apple"
              ),   
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?"),
            Gaps.h5,
            GestureDetector(
              onTap: () => onSignUpTap(context),
              child: Text(
                "Sign in", 
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