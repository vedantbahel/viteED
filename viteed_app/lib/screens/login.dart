import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import '../constants/validators.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isVisible = false;

  Future<bool> logIn(BuildContext context, WidgetRef ref) async {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    final res = await Authentication().login(
      _emailTextController.text,
      _passwordTextController.text,
      ref,
    );

    if (res == 'Logged in Successfully') {
      /// mounted property must be checked after async gap
      if (!mounted) return true;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(res),
      ));
      return true;
    } else {
      return false;
    }
  }

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

          /// removed inside [Scaffold] as it was unneccesary
          GestureDetector(
            /// when user click on screen other than required to unfocus primary focus and give user a good experience
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
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
                          "Log In \n",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            child: TextFormField(
                              controller: _emailTextController,
                              validator: (value) => Validators.validateEmail(email: value),
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Email',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "abc@xyz.com",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            child: TextFormField(
                              obscureText: !isVisible,
                              controller: _passwordTextController,
                              validator: (value) => Validators.validatePassword(password: value),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() {
                                    isVisible = !isVisible;
                                  }),
                                  icon: isVisible ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Password',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "*********",
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 300.0,
                            height: 50.0,
                            child: Consumer(
                              builder: (context, ref, child) => ElevatedButton(
                                onPressed: () {
                                  logIn(context, ref).then((value) {
                                    if (value) {
                                      Navigator.pushNamed(context, '/home');
                                    }
                                  });
                                  _passwordTextController.clear();
                                },
                                style: ButtonStyle(
                                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                        color: Color.fromARGB(1, 162, 156, 244),
                                      ),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(fontSize: 22),
                                ),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",

                              /// changed its colour to make it more asthetic
                              style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                            )),
                        TextButton(
                          onPressed: () => Navigator.pushNamed(context, '/signUp'),

                          /// Using Rich Text
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't have an account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 87, 87),
                                  ),
                                ),
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
