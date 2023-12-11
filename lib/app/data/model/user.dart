class User{
  User(this.username,this.fullname,this.password,this.email);
  
  String username;
  String fullname;
  String password;
  String email;

    Map<String, dynamic> toJson() {
    return {
      'username': username,
      'fullname': fullname,
      'password': password,
      'email': email,
    };
    }
}