import 'package:flutter/material.dart';
import 'package:viteed_app/screens/password_reset.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  ForgotPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(1, 162, 156, 244),
                ],
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.8),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 50),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("images/ViteEDLogo.png"),
                            width: 400,
                            height: 250,
                          ),
                        ),
                        const Text(
                          "Forgot Password \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            height: 60.0,
                            child: TextFormField(
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white.withOpacity(0.8),
                                  filled: true,
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: "abc@xyz.com"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            height: 60.0,
                            child: TextFormField(
                              controller: _passwordTextController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white.withOpacity(0.8),
                                  filled: true,
                                  labelText: 'OTP',
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  hintText: "856904"),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) =>
                                            PasswordReset())));
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color.fromRGBO(162, 156, 244, 1)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: const BorderSide(
                                      color: Color.fromARGB(1, 162, 156, 244),
                                    ),
                                  ),
                                ),
                              ),
                              child: const Text(
                                "Set Password",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            child: const Text(
                              "Already have an account? Login",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 87, 87, 87)),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
