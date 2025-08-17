import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/widgets/form_button.dart';


class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  
  String? isPasswordValid() {
    if(_password.isEmpty) return null;
    final regExp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$");
    if(!regExp.hasMatch(_password)) return "Password Not Valid";
    return null;
    }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTab(BuildContext context) {
  }
  
  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v36,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  ),
              ),
              Gaps.v3,
              const Text(
                "Set Your Password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54
                  ),
              ),
              Gaps.v16,
              TextField(
                keyboardType: TextInputType.visiblePassword,
                autocorrect: false,
                cursorColor: Colors.pink,
                controller: _passwordController,
                decoration: InputDecoration(
                  errorText: isPasswordValid(),
                  hintText: 'password',
                  hintStyle: TextStyle(
                    fontSize: 14,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink),
                  ),
                ),
              ),
              Gaps.v24,
              GestureDetector(
                onTap: () {
                  if (_password.isNotEmpty && isPasswordValid() == null) {
                  }
                },
                child: FormButton("Next", disabled: _password.isEmpty || isPasswordValid() != null)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
