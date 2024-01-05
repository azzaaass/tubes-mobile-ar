import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tubes_market_hewan/style/color.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    bool isKeyboardVisible = mediaQuery.viewInsets.bottom > 0;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: whiteBone,
        body: SafeArea(
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: navy,
                radius: 20,
                child: FaIcon(
                  FontAwesomeIcons.dove,
                  color: white,
                  size: 18,
                ),
              )
            ],
          ),
        ));
  }
}
