import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/widgets/form_button.dart';
import 'package:tik_tok/screens/password_screen.dart';


class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {

  final TextEditingController _emailController = TextEditingController();
  String _email = "";
  
  String? isEmailValid() {
    if(_email.isEmpty) return null;
    final regExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    if(!regExp.hasMatch(_email)) return "Email Not Valid";
    return null;
    }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTab(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PasswordScreen(),
      )
    );
  }
  
  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                "Write your email",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                  ),
              ),
              Gaps.v3,
              const Text(
                "You can always change it later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54
                  ),
              ),
              Gaps.v16,
              TextField(
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                cursorColor: Colors.pink,
                controller: _emailController,
                decoration: InputDecoration(
                  errorText: isEmailValid(),
                  hintText: 'Email',
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
                  if (_email.isNotEmpty && isEmailValid() == null) _onNextTab(context);
                },
                child: FormButton("Next", disabled: _email.isEmpty || isEmailValid() != null)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
