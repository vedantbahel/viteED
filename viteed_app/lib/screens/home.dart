import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viteed_app/constants/app_constants.dart';
import 'package:viteed_app/information.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/widgets/compose_card.dart';
import 'package:viteed_app/widgets/display_card.dart';
import '../providers/provider.dart';

class Home extends ConsumerWidget {
  Home({Key? key}) : super(key: key);

  final List<String> suggestions = [
    "Trending",
    "Recommendation",
    "Flutter",
    "Figma",
    "Literature",
    "Chemistry",
    "Education",
    "Science",
  ];

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();
    prefs.then((value) => {
          if (value.getBool('login') == true)
            {
              ref.read(sessIdProvider.notifier).state = value.getString('id')!,
              ref.read(userNameProvider.notifier).state =
                  value.getString('userId')!,
              ref.read(emailProvider.notifier).state =
                  value.getString('email')!,
            }
        });
    final showSearch = ref.watch(showList);
    final textEditingController = ref.watch(controller);
    final width = MediaQuery.of(context).size.width;
    final uname = ref.watch(userNameProvider);
    final userDoc = databases.getDocument(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.userColl,
        documentId: uname);
    userDoc.then((value) {
      ref.read(userDocProvider.notifier).state = value;
    });
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
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              width: 250,
              height: 40,
              child: TextField(
                onTap: () => ref.read(showList.notifier).state = true,
                scrollPadding: const EdgeInsets.only(left: 8, top: 20),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Search",
                  contentPadding: const EdgeInsets.all(10),
                  suffixIcon: const Icon(Icons.search),
                  prefixIcon: showSearch
                      ? GestureDetector(
                          onTap: () {
                            ref.read(showList.notifier).state = false;
                            ref.read(controller.notifier).state.text = '';
                          },
                          child: const Icon(Icons.clear))
                      : null,
                ),
                cursorColor: const Color.fromRGBO(162, 156, 244, 1),
                controller: textEditingController,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (_) => const ComposeCard());
        },
        child: const Icon(
          Icons.add,
          size: 31,
        ),
      ),
      body: showSearch
          ? ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (BuildContext _, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref.read(controller.notifier).state.text =
                              suggestions[index];
                          ref.read(showList.notifier).state = false;
                          topics = sortTopics(topics, suggestions[index]);
                        },
                        child: Container(
                          height: 20,
                          color: Colors.yellow,
                          child: Text(
                            suggestions[index],
                            style: const TextStyle(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ))
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: Text('Welcome $uname ☺',
                      style: GoogleFonts.poppins(
                          textStyle: const TextStyle(fontSize: 20))),
                ),
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

  SizedBox scrollbarBuild() {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: trending.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const DisplayCard(
                        title: "Figma 101",
                        content:
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation"
                            " ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat "
                            "cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab"
                            " illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?",
                        author: "John Doe",
                        likes: 44);
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(
                  top: 12, bottom: 12, left: 5, right: 20),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(trending[index]["imagePath"]!)),
                  border: Border.all(
                      color: const Color.fromRGBO(162, 156, 244, 1), width: 2),
                  borderRadius: BorderRadius.circular(15)),
            ),
          );
        },
      ),
    );
  }
}
