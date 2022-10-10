import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as models;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:viteed_app/constants/app_constants.dart';
import 'package:viteed_app/providers/provider.dart';

class Authentication {
  Future<String> login(
    String email,
    String pass,
    WidgetRef ref,
  ) async {
    Account account = Account(client);
    models.Session user;
    try {
      user = await account.createEmailSession(email: email, password: pass);
      ref.read(sessIdProvider.notifier).state = user.$id;
      ref.read(userNameProvider.notifier).state = user.userId;
      ref.read(emailProvider.notifier).state = email;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('id', user.$id);
      prefs.setString('userId', user.userId);
      prefs.setString('email', email);
      prefs.setBool('login', true);
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
    List<String> domains,
  ) async {
    Account account = Account(client);
    try {
      await account.create(
          userId: uname, email: email, password: pass, name: name);
      databases.createDocument(
        databaseId: AppConstants.databaseId,
        collectionId: AppConstants.userColl,
        documentId: uname,
        data: {
          'topics': domains,
          'name': name,
        },
      );
      return 'Account Created';
    } on AppwriteException catch (e) {
      return e.message!;
    }
  }

  Future<bool> logout(
      WidgetRef ref, String sessId, BuildContext context) async {
    Account account = Account(client);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await account.deleteSession(sessionId: sessId);
      ref.refresh(sessIdProvider);
      ref.refresh(userNameProvider);
      ref.refresh(emailProvider);
      ref.refresh(userDocProvider);
      prefs.setBool('login', false);
      prefs.remove('userId');
      prefs.remove('email');
      prefs.remove('id');
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
