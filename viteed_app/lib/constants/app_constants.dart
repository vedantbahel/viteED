import 'package:appwrite/appwrite.dart';

Client client = Client();
Account globalAccount = Account(client);
Databases databases = Databases(client, databaseId: AppConstants.databaseId);

class AppConstants {
  AppConstants._();
  static const String projectId = '62e5443fccd2ccc9cf5a'; // Your project ID
  static const String endPoint = 'http://10.0.2.2/v1'; // Your Appwrite Endpoint
  static const String userColl = '62e8bbc94ba49e75f022'; // Your Collection ID
  static const String databaseId = '62e8bbba75e44ea4c7c0'; // Your Database ID 
}
