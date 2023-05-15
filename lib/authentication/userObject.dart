class UserObject {
  String firstname = '';
  String lastname = '';
  String ref = '';

  UserObject.fromMap(data) {
    firstname = data['firstname'];
    lastname = data['lastname'];
    ref = data['ref'];
  }
}
