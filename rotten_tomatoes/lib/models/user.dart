class User {
  final String id;
  final String fullName;
  String email;
  String username;
  final String bio;

  User({this.id, this.fullName, this.email, this.username, this.bio});
  User.fromMap(Map snapshot,String id) :
        id = id ?? '',
        fullName = snapshot['fullName'] ?? '',
        email = snapshot['email'] ?? '',
        username = snapshot['username'] ?? '',
        bio = snapshot['bio'] ?? '';

  toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'username': username,
      'bio' : bio,
    };
  }
}