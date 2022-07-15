import 'package:flutter/material.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import '../constants/validators.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _nameTextController = TextEditingController();

  final TextEditingController _usernameTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  bool isVisible = false;

  void signUp(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final res = await Authentication().signUp(
      _emailTextController.text,
      _passwordTextController.text,
      _nameTextController.text,
      _usernameTextController.text,
    );

    /// mounted property must be checked after async gap
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(res),
    ));

    if (res == 'Account Created') {
      /// mounted property must be checked after async gap
      if (!mounted) return;
      Navigator.pop(context);
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
          GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(0.8),
                child: Center(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("images/ViteEDLogo.png"),
                            width: 400,
                            height: 250,
                          ),
                        ),
                        const Text("Sign Up \n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            child: TextFormField(
                              validator: (value) => Validators.validateName(name: value),
                              controller: _nameTextController,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(20.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white.withOpacity(0.8),
                                  filled: true,
                                  labelText: 'Full Name',
                                  labelStyle: const TextStyle(
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
                            child: TextFormField(
                              validator: (value) => Validators.validateUname(name: value),
                              controller: _usernameTextController,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(20.0)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                fillColor: Colors.white.withOpacity(0.8),
                                filled: true,
                                labelText: 'Username',
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                hintText: "john_doe",
                              ),
                            ),
                          ),
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
                                  hintText: "abc@xyz.com"),
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
                                  enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.white, width: 2.0), borderRadius: BorderRadius.circular(20.0)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  fillColor: Colors.white.withOpacity(0.8),
                                  filled: true,
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(
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
                              onPressed: () => signUp(context),
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
                                "SignUp",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Already have an account? ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 87, 87, 87),
                                  ),
                                ),
                                TextSpan(
                                  text: "LogIn",
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
