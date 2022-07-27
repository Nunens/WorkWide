import 'dart:developer';
import 'dart:typed_data';

import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

import 'user_conv.dart';

class UserData {
  final Client client;
  late Database database;
  late Storage storage;
  late Account account;

  UserData(this.client) {
    account = Account(client);
    storage = Storage(client);
    database = Database(client);
  }

  Future<String?> uploadProfilePicture(String filePath, String imgName) async {
    try {
      User res = await account.get();
      File? result = await storage.createFile(
        file: InputFile(filename: imgName, path: filePath),
        fileId: 'unique()',
        read: [
          'role:all',
          'user:${res.$id}'
        ], //Enables all user types to upload to storage
        bucketId: 'APP_WRITE_BUCKET_ID',
      );
      return result.$id;
    } catch (e) {
      log('$e');
      rethrow;
    }
  }

  Future<void> addUser(String name, String bio, String imgId) async {
    User res = await account.get();

    try {
      await account.updateName(name: name);
      await database.createDocument(
          collectionId: '629de011285e126b9c99',
          documentId: res.$id,
          data: {
            'name': name,
            'bio': bio,
            'imgId': imgId,
            'email': res.email,
            'id': res.$id,
          },
          read: [
            'role:all',
            'user:${res.$id}'
          ]);
    } catch (_) {
      rethrow;
    }
  }

  Future<ConvUser?> getCurrentUser() async {
    try {
      final user = await account.get();
      final data = await database.getDocument(
          collectionId: '629de011285e126b9c99', documentId: user.$id);
      final img = await _getProfilePicture(data.data['imgId']);
      return ConvUser.fromMap(data.data).copyWith(image: img);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<ConvUser>> getUsersList() async {
    try {
      final response = await database.listDocuments(collectionId: 'users');
      final List<ConvUser> users = [];
      final temp = response.documents;
      if (temp.isEmpty) {
        return users;
      }
      for (var element in temp) {
        final memImage =
            await _getProfilePicture(element.data['imgId'] as String);
        users.add(ConvUser.fromMap(element.data).copyWith(image: memImage));
      }
      return users;
    } on AppwriteException {
      rethrow;
    }
  }

  Future<Uint8List> _getProfilePicture(String fileId) async {
    try {
      final data =
          await storage.getFilePreview(fileId: fileId, bucketId: 'unique()');
      return data;
    } on AppwriteException {
      rethrow;
    }
  }
}
