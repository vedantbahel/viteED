import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viteed_app/information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import '../providers/provider.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 228, 247),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Color.fromARGB(255, 229, 228, 247),
          elevation: 1.8,
          actions: [
            SizedBox(width: 10),
            Image.asset(
              "assets/ViteEDLogo.png",
              scale: 5,
            ),
            Spacer(),
            Center(
                child: Container(
                    margin: EdgeInsets.only(right: 12),
                    width: 250,
                    height: 40,
                    child: TextField(
                      scrollPadding: EdgeInsets.only(left: 8, top: 20),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                      ),
                      cursorColor: Color.fromRGBO(162, 156, 244, 1),
                    ))),

            //
          ],
        ),
        body: ListView.builder(
            itemCount: topics.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 8, bottom: 12),
                padding: EdgeInsets.only(left: 20),
                height: 190,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      topics[index]["name"]!,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 25,
                              color: Color.fromRGBO(162, 156, 244, 1))),
                    ),
                    scrollbarBuild(),
                  ],
                ),
              );
            }),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.message_outlined),
                label: "Message",
                backgroundColor: Color.fromRGBO(162, 156, 244, 1)),
            const BottomNavigationBarItem(
                icon: Icon(Icons.save),
                label: "Save",
                backgroundColor: Color.fromRGBO(162, 156, 244, 1)),
            const BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: "Add",
                backgroundColor: Color.fromRGBO(162, 156, 244, 1)),
            const BottomNavigationBarItem(
                icon: Icon(Icons.account_box_outlined),
                label: "Profile",
                backgroundColor: Color.fromRGBO(162, 156, 244, 1))
          ],
          selectedItemColor: Color.fromARGB(255, 229, 228, 247),
        ));
  }

  SizedBox scrollbarBuild() {
    return SizedBox(
        height: 150,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: trending.length,
            itemBuilder: (context, index) {
              return Container(
                margin:
                    EdgeInsets.only(top: 12, bottom: 12, left: 5, right: 20),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(trending[index]["imagePath"]!)),
                    border: Border.all(
                        color: Color.fromRGBO(162, 156, 244, 1), width: 2),
                    borderRadius: BorderRadius.circular(15)),
              );
            }));
  }
}
