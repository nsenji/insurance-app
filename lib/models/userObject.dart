class UserObject {
  String firstname = '';
  String lastname = '';
  String ref = '';
  String email = '';
  dynamic profilePicture = '';
  dynamic profileComplete = false;

  UserObject();
  UserObject.fromMap(data) {
    firstname = data['firstname'];
    lastname = data['lastname'];
    ref = data['ref'];
    email = data['email'];
    profilePicture = data['profilePicture'];
    profileComplete = data['profileComplete'];
  }
}
