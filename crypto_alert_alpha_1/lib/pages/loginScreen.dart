import 'package:flutter/material.dart';

import 'signUpScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 2,
                      width: 40,
                      color: Colors.cyan,
                    ),
                    Text(
                      'CRYPTONiTE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 29,
                          color: Colors.cyan),
                    ),
                    Container(
                      height: 2,
                      width: 40,
                      color: Colors.cyan,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(20)),
                        width: size.width * 0.7,
                        child: TextField(
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: Colors.cyan,
                              ),
                              hintText: "Your Email",
                              border: InputBorder.none),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        padding: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: Colors.cyan[50],
                            borderRadius: BorderRadius.circular(20)),
                        width: size.width * 0.7,
                        child: TextField(
                          obscureText: isPasswordVisible,
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.cyan,
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  passwordVisibility();
                                },
                                child: Icon(
                                  Icons.visibility,
                                  color: Colors.cyan,
                                ),
                              ),
                              hintText: "Your Password",
                              border: InputBorder.none),
                        )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: size.width * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    color: Colors.cyan,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'LOGiN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: Text(
                        "SiGN UP",
                        style: TextStyle(
                            color: Colors.cyan, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void passwordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
}
