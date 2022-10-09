import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final showList = StateProvider((ref) => false);
final controller = StateProvider((ref) => TextEditingController(text: ''));
final sesiIdProvider = StateProvider((ref) => '');
final sessionProvider = StateProvider<Session>((ref) => session1);
final currentUserProvider = StateProvider<Account>((ref) => user1);
final userDocProvider = StateProvider<Document>((ref) => document);

Document document = Document(
    $id: '',
    $collectionId: '',
    $createdAt: '',
    $updatedAt: '',
    $databaseId: '',
    $permissions: [],
    data: {});

Account user1 = Account(
  $id: '',
  $createdAt: '',
  $updatedAt: '',
  name: '',
  registration: '',
  status: false,
  passwordUpdate: '',
  email: '',
  phone: '',
  emailVerification: false,
  phoneVerification: false,
  prefs: Preferences(
    data: {},
  ),
);

Session session1 = Session(
  $id: '',
  $createdAt: '',
  userId: '',
  expire: '',
  provider: '',
  providerUid: '',
  providerAccessToken: '',
  providerAccessTokenExpiry: '',
  providerRefreshToken: '',
  ip: '',
  osCode: '',
  osName: '',
  osVersion: '',
  clientType: '',
  clientCode: '',
  clientName: '',
  clientVersion: '',
  clientEngine: '',
  clientEngineVersion: '',
  deviceName: '',
  deviceModel: '',
  deviceBrand: '',
  countryCode: '',
  countryName: '',
  current: true,
);
