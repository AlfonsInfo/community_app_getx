class UserProfile{
  final String username;
  final String fullname;
  final String? email;

  UserProfile({required this.fullname, required this.username, required this.email});
  
  UserProfile.fromJson(Map<String, dynamic> json)
    : username = json['username'] as String,
      fullname = json['fullname'] as String,
      email = json['email'] as String;

  Map<String, dynamic> toJson() => {
    'username' : username,
    'fullname' : fullname,
    'email' : email
  };
  
}