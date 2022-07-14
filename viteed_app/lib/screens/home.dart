import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/auth/authenticaton.dart';
import '../providers/provider.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(sessionProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
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
      body: Center(
        child: Text(
          'Welcome ${session.userId}',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'LogOut',
        onPressed: () {
          Authentication().logout(ref, session.$id, context).then(
                (value) => {
                  if (value) {Navigator.pop(context)}
                },
              );
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}
