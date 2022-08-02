import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DisplayCard extends StatelessWidget {
  final String title, content, author;
  final int likes;
  final bool userHasLiked;

  const DisplayCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.author,
      required this.likes,
      this.userHasLiked = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      //route to report post screen
                    },
                    child: const Text(
                      "Report",
                      style: TextStyle(
                          color: Color.fromRGBO(162, 156, 244, 1),
                          fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 25),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(
                  Icons.close,
                  size: 35,
                  color: Color.fromRGBO(162, 156, 244, 1),
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.3,
            child: SingleChildScrollView(
              child: Text(
                content,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  author,
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(162, 156, 244, 1))),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  //add or remove like
                },
                child: Icon(
                  (userHasLiked) ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.red,
                ),
              ),
              Text(
                "$likes",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              )
            ],
          )
        ],
      ),
    );
  }
}
