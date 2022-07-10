import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Center(
          child: Image(
            image: AssetImage("images/ViteEDLogo.png"),
            width: 250,
            height: 100,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.person),
            color: Color.fromRGBO(162, 156, 244, 1),
          )
        ],
        shadowColor: Color.fromRGBO(162, 156, 244, 1),
      ),
    );
  }
}
