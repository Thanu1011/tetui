import 'package:flutter/material.dart';
import 'package:fluttertui_app/view_bot/custom_widget.dart';
import 'package:fluttertui_app/view/pages/options_page.dart';
import 'file:///C:/Users/Thanu/AndroidStudioProjects/fluttertui_app/lib/view/pages/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final fundController = TextEditingController();

  String message = '';

  @override
  void dispose() {
    nameController.dispose();
    fundController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          HeroImage(),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  )),
                          controller: nameController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'name cannot be empty';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  )),
                          controller: fundController,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('New User?',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                               )),
                            FlatButton(
                              child: Text(
                                'Signup',
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,),

                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignupPage();
                                }));
                              },
                            )
                          ],
                        ),
                        CustomButton(
                          btnText: 'Sign In',
                          onBtnPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return Demo();
                            }));
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
