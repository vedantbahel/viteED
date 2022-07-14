import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sesiIdProvider = StateProvider((ref) => '');
final sessionProvider = StateProvider<Session>((ref) => session1);

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
