import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:viteed_app/providers/provider.dart';

import '../constants/apis.dart';

class Authentication {
  Future<String> login(
    String email,
    String pass,
    WidgetRef ref,
  ) async {
    Account account = Account(client);
    Session user;
    try {
      user = await account.createEmailSession(email: email, password: pass);
      ref.read(sesiIdProvider.notifier).state = user.$id;
      ref.read(sessionProvider.notifier).state = user;
      return 'Logged in Successfully';
    } on AppwriteException catch (e) {
      return e.message!;
    }
  }

  Future<String> signUp(
    String email,
    String pass,
    String name,
    String uname,
  ) async {
    Account account = Account(client);
    try {
      await account.create(
          userId: uname, email: email, password: pass, name: name);
      return 'Account Created';
    } on AppwriteException catch (e) {
      return e.message!;
    }
  }

  Future<bool> logout(
      WidgetRef ref, String sessId, BuildContext context) async {
    Account account = Account(client);
    try {
      await account.deleteSession(sessionId: sessId);
      ref.read(sesiIdProvider.notifier).state = '';
      ref.refresh(sessionProvider);
      return true;
    } on AppwriteException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message!),
        ),
      );
      return false;
    }
  }
}
