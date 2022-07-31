import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:viteed_app/information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/screens/profile.dart';
import '../providers/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();

  // @override
  // Widget buildSuggestion(BuildContext context) {
  //   List<String> suggestions = [
  //     "Trending",
  //     "Recommendation",
  //     "Flutter",
  //     "Figma",
  //     "Literature",
  //     "Chemistry",
  //     "Chemsitry",
  //     "Education",
  //     "Science",
  //     ];

  //     return ListView.builder(
  //       itemCount: suggestions.length,
  //       itemBuilder: (context, index) {
  //         final suggestion = suggestions[index];

  //         return ListTile(
  //           title: Text(suggestion),
  //           onTap: (){

  //           },
  //         );
  //       },
  //     );
  // }
}

class _TestState extends State<Home> {
  bool showList = false;
  TextEditingController textEditingController = TextEditingController(text: '');
  List<String> suggestionsField = [
    "Trending",
    "Recommendation",
    "Flutter",
    "Figma",
    "Literature",
    "Chemistry",
    "Chemsitry",
    "Education",
    "Science",
  ];
  List<String> suggestions = [
    "Trending",
    "Recommendation",
    "Flutter",
    "Figma",
    "Literature",
    "Chemistry",
    "Chemsitry",
    "Education",
    "Science",
  ];
  void initState() {
    super.initState();
  }

  List<dynamic> sortTopics(List<dynamic> topic, String key) {
    List<dynamic> newTopic = [
      {'name': key}
    ];
    for (int i = 0; i < topic.length; i++) {
      if (topic[i]['name'] != key) {
        newTopic.add(topic[i]);
      }
    }
    return newTopic;
  }

  List<Widget> buildSuggestions() {
    return suggestionsField.map((suggestion) {
      return Text(
        suggestion,
      );
    }).toList();
  }

  List<Widget> empty() {
    return [];
  }

  SizedBox scrollbarBuild() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: trending.length,
        itemBuilder: (context, index) {
          return Container(
            margin:
                const EdgeInsets.only(top: 12, bottom: 12, left: 5, right: 20),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(trending[index]["imagePath"]!)),
                border: Border.all(
                    color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                borderRadius: BorderRadius.circular(15)),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final session = ref.watch(sessionProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 228, 247),
      appBar: AppBar(
        //   centerTitle: true,
        // elevation: 0,
        //   toolbarHeight: 80,
        //    backgroundColor: Colors.white,
        // title: const Center(
        //   child: Image(
        //     image: AssetImage("images/ViteEDLogo.png"),
        //     width: 250,
        //     height: 100,
        //   ),
        // ),
        //   actions: <Widget>[
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.person),
        //     color: const Color.fromRGBO(162, 156, 244, 1),
        //   )
        // ],
        // shadowColor:
        backgroundColor: const Color.fromARGB(255, 229, 228, 247),
        elevation: 1.8,
        automaticallyImplyLeading: false,
        actions: [
          const SizedBox(width: 20),
          Image.asset(
            "images/ViteEDLogo.png",
            scale: 5,
          ),
          const Spacer(),
          Center(
              child: Column(children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(right: 12),
                width: 250,
                height: 40,
                child: TextField(
                  onTap: () {
                    setState(() {
                      showList = true;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      suggestionsField = suggestions.where((element) {
                        return element
                            .toLowerCase()
                            .contains(value.toLowerCase());
                      }).toList();
                    });
                  },
                  scrollPadding: const EdgeInsets.only(left: 8, top: 20),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: "Search",
                    contentPadding: const EdgeInsets.all(10),
                    suffixIcon: const Icon(Icons.search),
                    prefixIcon: showList
                        ? GestureDetector(
                            onTap: (() => setState(() => showList = false)),
                            child: Icon(Icons.clear))
                        : null,
                  ),
                  cursorColor: const Color.fromRGBO(162, 156, 244, 1),
                  controller: textEditingController,
                ),
              ),
            ),
            // Column(children: showList ? _buildSuggestions() : empty(),)
          ])),
        ],
      ),
      body: showList
          ? Container(
              child: ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (BuildContext _, int index) => Container(
                        //Changethisfor theui
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (() => setState(() {
                                    textEditingController.text =
                                        suggestions[index];
                                    showList = false;
                                    topics =
                                        sortTopics(topics, suggestions[index]);
                                  })),
                              child: Container(
                                height: 20,
                                color: Colors.yellow,
                                child: Text(
                                  suggestions[index],
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(left: 20, top: 10),
                //   child: Text('Welcome ${session.userId} ☺',
                //       style: GoogleFonts.poppins(textStyle: TextStyle(fontSize: 20))),
                // ),
                Expanded(
                  child: ListView.builder(
                    itemCount: topics.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 12),
                        padding: const EdgeInsets.only(left: 20),
                        height: 190,
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              topics[index]["name"]!,
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 25,
                                      color: Color.fromRGBO(162, 156, 244, 1))),
                            ),
                            scrollbarBuild(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
      //       floatingActionButton: FloatingActionButton(
      //   tooltip: 'LogOut',
      //   onPressed: () {
      //     Authentication().logout(ref, session.$id, context).then(
      //           (value) => {
      //             if (value) {Navigator.pop(context)}
      //           },
      //         );
      //   },
      //   child: const Icon(Icons.exit_to_app),
      // ),
    );
  }
}
