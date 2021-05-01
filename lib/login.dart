import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'home.dart';
import 'preference.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          buildLoginPageAnimatedHeader1(),
          buildLoginPageAnimatedHeader2(),
          buildUsernameInput(),
          buildPasswordInput(),
          buildForgot_SignupRow(),
          buildLoginButton(),
          buildExtraLoginOptions()
        ],
      ),
    );
  }

  Container buildExtraLoginOptions() {
    return Container(
      margin: EdgeInsets.only(top: 70),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.google,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Login with Google',
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.lightBlue[400],
              ));
            },
          ),
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.facebook,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Login with Facebook',
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.lightBlue[400],
              ));
            },
          ),
          GestureDetector(
            child: FaIcon(
              FontAwesomeIcons.github,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  'Login with Github',
                  textAlign: TextAlign.center,
                ),
                backgroundColor: Colors.lightBlue[400],
              ));
            },
          )
        ],
      ),
    );
  }

  Container buildLoginButton() {
    return Container(
      padding: EdgeInsets.only(
        top: 100,
        left: 40,
        right: 40,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          enableFeedback: true,
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.lightBlueAccent[200],
          ),
        ),
        child: Text('Login'),
        onPressed: () {
          isloggedIn = true;
          loggedInUser = username ?? 'Harshit';
          Preference.setLoggedIn(isloggedIn);
          Preference.setLoggedInUser(loggedInUser);

          Navigator.pushReplacement(
            context,
            PageTransition(
              type: PageTransitionType.bottomToTop,
              child: Home(),
              duration: Duration(
                seconds: 2,
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildForgot_SignupRow() {
    return Container(
      padding: EdgeInsets.fromLTRB(
        40,
        20,
        40,
        0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: Text(
              'Forgot Password?',
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.lightBlueAccent[400],
                  content: Text(
                    'Change password',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
          SignUp(
            context: context,
          ),
        ],
      ),
    );
  }

  Container buildPasswordInput() {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Colors.lightBlueAccent[400],
          ),
          hintText: 'Password',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 1,
            ),
          ),
        ),
        obscureText: true,
        obscuringCharacter: '*',
      ),
    );
  }

  Container buildUsernameInput() {
    return Container(
      margin: EdgeInsets.only(
        left: 40,
        right: 40,
        top: 20,
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person_outline,
            color: Colors.lightBlueAccent[400],
          ),
          hintText: 'Username',
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
            borderSide: BorderSide(
              color: Colors.lightBlueAccent,
              width: 1,
            ),
          ),
        ),
        onChanged: (value) {
          username = value;
        },
      ),
    );
  }

  Center buildLoginPageAnimatedHeader1() {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(
          0,
          50,
          0,
          0,
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText(
              'Login To Enjoy',
              textStyle: const TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w300,
              ),
              speed: const Duration(
                milliseconds: 200,
              ),
            ),
          ],
          totalRepeatCount: 1,
          pause: const Duration(
            milliseconds: 1000,
          ),
          displayFullTextOnTap: false,
          stopPauseOnTap: false,
        ),
      ),
    );
  }

  Center buildLoginPageAnimatedHeader2() {
    return Center(
      child: Container(
        height: 150,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                pause: const Duration(
                  milliseconds: 100,
                ),
                animatedTexts: [
                  RotateAnimatedText(
                    'MOVIES',
                    textStyle: TextStyle(
                      color: Colors.redAccent[200],
                    ),
                  ),
                  RotateAnimatedText(
                    'SERIES',
                    textStyle: TextStyle(
                      color: Colors.blueAccent[200],
                    ),
                  ),
                  RotateAnimatedText(
                    'MUSIC',
                    textStyle: TextStyle(
                      color: Colors.greenAccent[200],
                    ),
                  ),
                ],
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(
        'SignUp',
      ),
      onTap: () {
        Scaffold.of(context).showBottomSheet(
          (context) => Container(
            color: Colors.white,
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      30,
                      0,
                      0,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'SignUp To Begin...',
                          textStyle: const TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w300,
                          ),
                          speed: const Duration(
                            milliseconds: 200,
                          ),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: const Duration(
                        milliseconds: 1000,
                      ),
                      displayFullTextOnTap: false,
                      stopPauseOnTap: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.edit,
                        color: Colors.lightBlueAccent[400],
                      ),
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.lightBlueAccent[400],
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.lightBlueAccent[400],
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.lightBlueAccent[400],
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                        fontSize: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        borderSide: BorderSide(
                          color: Colors.lightBlueAccent,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 100,
                    left: 40,
                    right: 40,
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      enableFeedback: true,
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.lightBlueAccent[200],
                      ),
                    ),
                    child: Text('SignUp'),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('SignUp Successful'),
                        backgroundColor: Colors.lightBlueAccent[400],
                      ));
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
