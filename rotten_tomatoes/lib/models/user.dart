class User {
  final String id;
  final String fullName;
  String email;
  final String username;
  User({this.id, this.fullName, this.email, this.username});
  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        fullName = data['fullName'],
        email = data['email'],
        username = data['username'];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'username': username,
    };
  }
}