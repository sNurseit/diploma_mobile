
class AuthRequest{
  String _email;
  String _password;

  AuthRequest(this._email, this._password);
  String get email => _email;


  set setEmail(String value) {
    _email = value;
  }

  String get password => _password;
  set setPassword(String value) {
    _password = value;
  }

}
