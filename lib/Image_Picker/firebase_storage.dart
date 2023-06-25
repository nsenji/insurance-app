import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

Future<String> uploadAvatar(File file, uid) async {
  final storageRef =
      FirebaseStorage.instance.ref().child('avatar/$uid/avatar.png');

  final uploadTask = storageRef
      .putFile(
          file,
          SettableMetadata(
            contentType: "image/jpeg",
          ))
      .snapshotEvents
      .listen((event) {
    if (event.state == TaskState.error) {
      print(event.state);
    }
  });
  final downloadUrl = storageRef.getDownloadURL();
  return downloadUrl;
}
