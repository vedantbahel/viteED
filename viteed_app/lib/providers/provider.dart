import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final showList = StateProvider((ref) => false);
final controller = StateProvider((ref) => TextEditingController(text: ''));
final sesiIdProvider = StateProvider((ref) => '');
final sessionProvider = StateProvider<Session>((ref) => session1);
final currentUserProvider = StateProvider<User>((ref) => user1);
final userDocProvider = StateProvider<Document>((ref) => document);

Document document = Document(
    $id: '',
    $collection: '',
    $createdAt: 0,
    $updatedAt: 0,
    $read: [],
    $write: [],
    data: {});

User user1 = User(
  $id: '',
  $createdAt: 0,
  $updatedAt: 0,
  name: '',
  registration: 0,
  status: false,
  passwordUpdate: 0,
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
  $createdAt: 1588888888,
  userId: '',
  expire: 1588888888,
  provider: '',
  providerUid: '',
  providerAccessToken: '',
  providerAccessTokenExpiry: 1588888888,
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
