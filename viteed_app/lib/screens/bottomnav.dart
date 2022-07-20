import 'package:flutter/material.dart';
import 'package:viteed_app/screens/home.dart';
import 'package:viteed_app/screens/profile.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int count = 0;
  final screens = [
    Home(),
    Center(child: Text("Message")),
    Center(child: Text("Add")),
    Center(child: Text("Save")),
    Profile()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[count],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(162, 156, 244, 1),
        type: BottomNavigationBarType.fixed,
        currentIndex: count,
        onTap: (index) => setState(() => count = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined), label: "Message"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 32,
              ),
              label: "Add"),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: "Save"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box_outlined), label: "Profile")
        ],
        selectedItemColor: const Color.fromARGB(255, 229, 228, 247),
      ),
    );
  }
}
