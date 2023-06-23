

// import 'dart:io';

// import 'package:firebase_storage/firebase_storage.dart';

// class FirebaseStorageService{

//   Future<String> _uploadAvatar(){
//     Future<String> upload({
//     required String uid,
//     required File file,
//     required String path,
//     required String contentType,
//   }) async {
//     print('uploading to: $path');
//     final storageReference = FirebaseStorage.instance.ref().child(path);
//     final uploadTask = storageReference.putFile(
//         file, StorageMetadata(contentType: contentType));
//     final snapshot = await uploadTask.onComplete;
//     if (snapshot.error != null) {
//       print('upload error code: ${snapshot.error}');
//       throw snapshot.error;
//     }
//     // Url used to download file/image
//     final downloadUrl = await snapshot.ref.getDownloadURL();
//     print('downloadUrl: $downloadUrl');
//     return downloadUrl;
//   }
//   }
// }