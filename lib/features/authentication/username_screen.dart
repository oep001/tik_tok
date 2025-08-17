import 'package:flutter/material.dart';
import 'package:tik_tok/constants/gaps.dart';
import 'package:tik_tok/features/authentication/email_screen.dart';
import 'package:tik_tok/features/authentication/widgets/form_button.dart';


class UserNameScreen extends StatefulWidget {
  const UserNameScreen({super.key});

  @override
  State<UserNameScreen> createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {

  final TextEditingController _usernameController = TextEditingController();
  String _username = "";
  
  void _onNextTab(BuildContext context) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => EmailScreen(),
        )
      );
    }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Create Username",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
            ),
            Gaps.v6,
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
              controller: _usernameController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink),
                ),
                hintText: 'Username',
                hintStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
              cursorColor: Colors.pink,
            ),
            Gaps.v24,
            GestureDetector(
              onTap: () {
                if (_username.isNotEmpty) {
                  _onNextTab(context);
                }
              },
              child: FormButton(disabled: _username.isEmpty)
              ),
          ],
        ),
      ),
    );
  }
}
