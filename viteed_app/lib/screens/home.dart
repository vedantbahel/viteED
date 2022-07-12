import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Center(
          child: Image(
            image: AssetImage("images/ViteEDLogo.png"),
            width: 250,
            height: 100,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
            color: const Color.fromRGBO(162, 156, 244, 1),
          )
        ],
        shadowColor: const Color.fromRGBO(162, 156, 244, 1),
      ),
    );
  }
}
