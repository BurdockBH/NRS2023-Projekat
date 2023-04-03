import 'package:flutter/material.dart';
import 'package:nrs2023/screens/logInPhone.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'loginAuth.dart';

class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn>{
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  InputDecoration registerInputDecoration(String labelText, String hintText) {
    return InputDecoration(
      isDense: true,
      contentPadding:
      const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
      filled: true,
      fillColor: Colors.white,
      labelText: labelText,
      hintText: hintText,
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Login"),
            centerTitle: true,
            leading: BackButton(
              onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: SizedBox(
                    width: 350,
                    child: Text("Login",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 33,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: SizedBox(
                    width: 350,
                    child: Text('E-mail',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                //controller: _controllers[0],
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                registerInputDecoration("Email", "Enter Email"),
                                onFieldSubmitted: (String value) {
                                  //FocusScope.of(context).requestFocus(_focusInput[0]);
                                },
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains("@")) {
                                    return 'Invalid address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: 350,
                      child: Text('Password',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Form(
                      key:_formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                              registerInputDecoration("Password", "Enter password"),
                              onFieldSubmitted: (String value) {
                                //FocusScope.of(context).requestFocus(_focusInput[0]);
                              },
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              //validator:
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SizedBox(
                      width: 350,
                      child:
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const logInPhone()),
                          );
                        },
                        child: const Text(
                            textAlign: TextAlign.center,
                            style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue),
                            'Login via phone number'
                        ),
                      ),
                      ),
                ),
                  const SizedBox(
                    height: 20,
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: MaterialButton(
                    elevation: 10,
                    height: 50,
                    minWidth: double.infinity,
                    onPressed: () {
                      print(_emailController.text + " " + _passwordController.text);
                        if (_emailController.text == "test@test.com" &&
                            _passwordController.text == "testTest12345") {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Success'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 64,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'You will now be prompted for 2FA!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginAuthScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Failure'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Icon(
                                      Icons.error,
                                      color: Colors.red,
                                      size: 64,
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      'Incorrect login info!',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                    },
                    color: Colors.blue,
                    child: const Text("LOGIN",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
                  Padding(padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          SignInButton(
                            Buttons.Google,
                            //mini: true,
                            onPressed: () {},
                          ),
                          SignInButton(
                            Buttons.Facebook,
                            onPressed: () {},
                          )
                        ],
                      ),
                  ),
                ],
            ),
        ),
       ),
    );
  }
}