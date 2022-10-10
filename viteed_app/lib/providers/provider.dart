import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

final showList = StateProvider((ref) => false);
final controller = StateProvider((ref) => TextEditingController(text: ''));
final sessIdProvider = StateProvider((ref) => '');
final userNameProvider = StateProvider<String>((ref) => '');
final emailProvider = StateProvider<String>((ref) => '');
final userDocProvider = StateProvider<Document>((ref) => document);

Document document = Document(
    $id: '',
    $collectionId: '',
    $createdAt: '',
    $updatedAt: '',
    $databaseId: '',
    $permissions: [],
    data: {});
