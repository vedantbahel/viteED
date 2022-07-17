import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 228, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 228, 247),
        elevation: 1.8,
        title: Center(
          child: Image.asset(
            "images/ViteEDLogo.png",
            width: 250,
            height: 100,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/profile.png"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 5)),
            ),
            SizedBox(height: 5),
            Text(
              "</Full Name>",
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            SizedBox(height: 10),
            Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                borderRadius: BorderRadius.circular(5),
                color: Color.fromARGB(255, 219, 217, 252),
              ),
              child: Center(
                child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(textStyle: TextStyle()),
                ),
              ),
            ),
            Container(
                height: 60,
                width: width,
                padding: EdgeInsets.all(15),
                margin:
                    EdgeInsets.only(top: 20, left: 40, right: 40, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(162, 156, 244, 1),
                        width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Text(
                      "Personal Information",
                      style: GoogleFonts.poppins(fontSize: 18),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            Container(
                height: 60,
                width: width,
                padding: EdgeInsets.all(15),
                margin:
                    EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(162, 156, 244, 1),
                        width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  Text(
                    "Interest",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(162, 156, 244, 1)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "</interest1>",
                        style: TextStyle(fontSize: 10),
                      ))),
                  SizedBox(width: 5),
                  Container(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(162, 156, 244, 1)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "</interest2>",
                        style: TextStyle(fontSize: 10),
                      ))),
                  SizedBox(width: 5),
                  Container(
                      padding: EdgeInsets.only(right: 5, left: 5),
                      height: 20,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromRGBO(162, 156, 244, 1)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "</interest3>",
                        style: TextStyle(fontSize: 10),
                      )))
                ])),
            Container(
                height: 60,
                width: width,
                padding: EdgeInsets.all(15),
                margin:
                    EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromRGBO(162, 156, 244, 1),
                        width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(children: [
                  Text(
                    "Blogs Written",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  Spacer(),
                  Icon(Icons.arrow_drop_down)
                ])),
            Container(
                height: 60,
                width: width,
                padding: EdgeInsets.all(15),
                margin:
                    EdgeInsets.only(top: 10, left: 40, right: 40, bottom: 10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 232, 105, 95),
                    border: Border.all(
                        color: const Color.fromRGBO(162, 156, 244, 1),
                        width: 2),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                    child: Text(
                  "Log Out",
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ))),
            Text("Development Testing v1.0.0")
          ],
        ),
      ),
    );
  }
}
