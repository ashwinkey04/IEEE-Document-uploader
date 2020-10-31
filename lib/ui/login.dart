import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/sign_in.dart';
import '../main.dart';

FirebaseLogin newUser = new FirebaseLogin();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 80,),
              Text(
                "AASAAN",
                style: TextStyle(
                  fontSize: 36,
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Scan karo, Upload karo",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80,),
              Image.asset(
                'img/doc.png',
                height: 300,
                width: 400,
              ),
              SizedBox(
                height: 30,
              ),
              _signInButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return InkWell(
      onTap: () {
        newUser.signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MainPageWidget();
              },
            ),
          );
        });
      },
      child: Container(
        width: MediaQuery. of(context).size.width * 0.9,
        height: 50,
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login, size: 20,color: Colors.white,),
            SizedBox(width: 10,),
            Text(
              'SIGN IN',
              style: TextStyle(color: kWhite, fontSize: 19),
            ),
          ],
        ),
      ),
    );
  }
}