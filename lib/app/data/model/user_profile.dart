class UserProfile{
  String? username;
  String? fullname;
  String? email;
  String? bioDescription;
  bool? gender;
  UserProfile({this.fullname, this.username, this.email});
  
  UserProfile.fromJson(Map<String, dynamic> json)
    : username = json['username'] as String,
      fullname = json['fullname'] as String,
      email = json['email'] as String;


  Map<String, dynamic> toJson() => {
    'username' : username,
    'fullname' : fullname,
    'email' : email,
    'bio_description' : bioDescription,
    'gender' : gender,
  };
  
}