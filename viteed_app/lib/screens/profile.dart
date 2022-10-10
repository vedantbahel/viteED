import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import 'package:viteed_app/screens/login.dart';
import '../providers/provider.dart';

class Profile extends ConsumerWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final userDoc = ref.read(userDocProvider);
    final email = ref.read(emailProvider);
    final sesid = ref.watch(sessIdProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 228, 247),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 228, 247),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Center(
          child: Image.asset(
            "images/ViteEDLogo.png",
            width: 250,
            height: 100,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        height: height,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 110,
              width: 110,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(userDoc.data['profilepic']),
                  ),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 5)),
            ),
            const SizedBox(height: 5),
            Text(
              userDoc.data['name'],
              style: GoogleFonts.poppins(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Container(
              width: 60,
              height: 20,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                borderRadius: BorderRadius.circular(5),
                color: const Color.fromARGB(255, 219, 217, 252),
              ),
              child: Center(
                child: Text(
                  "Edit",
                  style: GoogleFonts.poppins(),
                ),
              ),
            ),
            Container(
              height: 60,
              width: width,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(
                  top: 20, left: 40, right: 40, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    email,
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              height: 60,
              width: width,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(
                  top: 10, left: 40, right: 40, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    "Interest",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Container(
                              padding: const EdgeInsets.only(right: 5, left: 5),
                              height: 20,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromRGBO(
                                          162, 156, 244, 1)),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  userDoc.data['topics'][index],
                                  style: const TextStyle(fontSize: 15),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: userDoc.data['topics'].length),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: width,
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.only(
                  top: 10, left: 40, right: 40, bottom: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Text(
                    "Blogs Written",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 100.0, right: 100.0),
              child: ElevatedButton(
                onPressed: () {
                  Authentication().logout(ref, sesid, context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Center(
                  child: Text(
                    "Log Out",
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            const Text("Development Testing v1.0.0")
          ],
        ),
      ),
    );
  }
}
