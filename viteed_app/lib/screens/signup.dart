import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import '../constants/validators.dart';

class Domain {
  final int id;
  final String name;

  Domain({
    required this.id,
    required this.name,
  });
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static final List<Domain?> _domains = [
    Domain(id: 1, name: "Software Engineering"),
    Domain(id: 2, name: "Web Dev"),
    Domain(id: 3, name: "Mobile App Dev"),
    Domain(id: 4, name: "Product Designing"),
    Domain(id: 5, name: "Machine learning"),
    Domain(id: 6, name: "Cyber Security"),
  ];
  final _items = _domains
      .map((domain) => MultiSelectItem<Domain>(domain!, domain.name))
      .toList();
  List<Domain> _selectedDomainsConfirm = [];

  final TextEditingController _emailTextController = TextEditingController();

  final TextEditingController _passwordTextController = TextEditingController();

  final TextEditingController _nameTextController = TextEditingController();

  final TextEditingController _usernameTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _multiSelectKey = GlobalKey<FormFieldState>();

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

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(res),
    ));

    if (res == 'Account Created') {
      Navigator.pop(context);
    }
  }

  List<Domain> _selectedDomainInitial = [];
  @override
  void initState() {
    List<Domain?> _selectedDomainInitial = _domains;
    super.initState();
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
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Image(
                            image: AssetImage("images/ViteEDLogo.png"),
                            width: 400,
                            height: 250,
                          ),
                        ),
                        const Text("Sign Up \n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: 350.0,
                            child: TextFormField(
                              validator: (value) =>
                                  Validators.validateName(name: value),
                              controller: _nameTextController,
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
                              validator: (value) =>
                                  Validators.validateUname(name: value),
                              controller: _usernameTextController,
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
                                  labelText: 'Username',
                                  labelStyle: const TextStyle(
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
                            child: TextFormField(
                              controller: _emailTextController,
                              validator: (value) =>
                                  Validators.validateEmail(email: value),
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
                            child: TextFormField(
                              obscureText: !isVisible,
                              controller: _passwordTextController,
                              validator: (value) =>
                                  Validators.validatePassword(password: value),
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    onPressed: () => setState(() {
                                      isVisible = !isVisible;
                                    }),
                                    icon: isVisible
                                        ? const Icon(Icons.visibility_off)
                                        : const Icon(Icons.visibility),
                                  ),
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
                            width: 353.0,
                            child: MultiSelectBottomSheetField<Domain?>(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 9,
                                  )),
                              key: _multiSelectKey,
                              initialChildSize: 0.5,
                              maxChildSize: 0.90,
                              title: const Text("Select Domains"),
                              buttonText: const Text(
                                "Domains",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.left,
                              ),
                              items: _items,
                              searchable: true,
                              validator: (values) {
                                if (values == null || values.isEmpty) {
                                  return "Required";
                                }
                                if (values.length < 3) {
                                  return "Minimum 3 required";
                                }

                                return null;
                              },
                              onConfirm: (values) {
                                setState(() {
                                  List<Domain?> _selectedDomainsConfirm =
                                      values;
                                });
                                _multiSelectKey.currentState!.validate();
                              },
                              chipDisplay: MultiSelectChipDisplay(
                                onTap: (item) {
                                  setState(() {
                                    _selectedDomainsConfirm.remove(item);
                                  });
                                  _multiSelectKey.currentState!.validate();
                                },
                              ),
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
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
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
                                "Sign Up",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Already have an account? LogIn",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 87, 87, 87),
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
