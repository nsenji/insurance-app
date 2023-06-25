import 'package:insurease/authentication/getUser.dart';

import '../Firebase_paths/user_by_ID.dart';
import '../notifiers/userObjectNotifier.dart';

updateUser(UserNotifier userNotifier, UserByID userByID) async {
  // var db = FirebaseFirestore.instance;
  // var user = FirebaseAuth.instance.currentUser;

  // var query = await db
  //     .collection("users")
  //     .where("uniqueID", isEqualTo: user!.uid)
  //     .get();

  final data = userByID.dataList;
  try {
    data[0].reference.update({"profileComplete": true}).then(
        (value) => print('successfully updated'),
        onError: (e) => print('error while updateing $e'));
  
    getUser(userNotifier,userByID);
  } catch (e) {
    print('$e');
  }
}
