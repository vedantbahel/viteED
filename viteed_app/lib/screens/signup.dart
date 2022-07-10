import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _usernameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                padding: EdgeInsets.all(0.8),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(children: [
                      Text("\n \n"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image(
                          image: AssetImage("images/ViteEDLogo.png"),
                          width: 400,
                          height: 250,
                        ),
                      ),
                      Text("Sign Up \n",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25)),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 350.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _nameTextController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Full Name',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "John Doe"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 350.0,
                          height: 60.0,
                          child: TextFormField(
                            controller: _usernameTextController,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Username',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "john_doe"),
                          ),
                        ),
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Email',
                                labelStyle: TextStyle(
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
                                    borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "*********"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 300.0,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: (){},
                            child: Text(
                              "Login",
                              style: TextStyle(fontSize: 22),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromRGBO(162, 156, 244, 1)),
                                shape:
                                    MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(18.0),
                                            side: BorderSide(
                                                color: Color.fromARGB(
                                                    1, 162, 156, 244))))),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 87, 87, 87)),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 87, 87, 87)),
                          )),
                    ]),
                  ),
                ),
              ),
            )),
      ],
    ));


  }
}
