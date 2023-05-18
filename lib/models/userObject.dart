class UserObject {
  String firstname = '';
  String lastname = '';
  String ref = '';
  String email = '';
  dynamic profileComplete = false;

  UserObject.fromMap(data) {
    firstname = data['firstname'];
    lastname = data['lastname'];
    ref = data['ref'];
    email = data['email'];
    profileComplete = data['profileComplete'];
  }
}
