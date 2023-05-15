class UserObject {
  String firstname = '';
  String lastname = '';
  String ref = '';
  String email = '';

  UserObject.fromMap(data) {
    firstname = data['firstname'];
    lastname = data['lastname'];
    ref = data['ref'];
    email = data['email'];
  }
}
