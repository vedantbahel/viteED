import 'package:flutter/material.dart';

class ComposeCard extends StatefulWidget {
  const ComposeCard({Key? key}) : super(key: key);

  @override
  State<ComposeCard> createState() => _ComposeCardState();
}

class _ComposeCardState extends State<ComposeCard> {

  final TextEditingController _titleEditingController = TextEditingController();
  final TextEditingController _contentEditingController = TextEditingController();

  @override
  void dispose() {
    _titleEditingController.dispose();
    _contentEditingController.dispose();
    super.dispose();
  }

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
                    onTap: (){
                      //route to report post screen
                    },
                    child: const Text(
                      "Drafts",
                      style: TextStyle(
                          color: Color.fromRGBO(162, 156, 244, 1), fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width/2.4,
                    child: TextField(
                      controller: _titleEditingController,
                      decoration: const InputDecoration(
                        hintText: "Title",
                        border: InputBorder.none
                      ),
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25),
                    ),
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
          SizedBox(
            height: MediaQuery.of(context).size.height/2.3,
            child: SingleChildScrollView(
              child: TextField(
                controller: _contentEditingController,
                maxLines: 50,
                decoration: const InputDecoration(
                  hintText: "Start typing to compose.."
                ),
              ),
            ),
          ),
          const SizedBox(height: 5,),
          Center(child: TextButton(onPressed: (){
            //save as draft function
          },
              child: const Text("Save as Draft"))),
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width/2,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  //get values from textEditingControllers and publish post
                },
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
                  "Post",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),)
        ],
      ),
    );
  }
}

