class SocialUser {
  final String id;
  final String email;
  final String displayName;
  final String phoneNumber;
  final String photoUrl;
  final String gender;

  SocialUser(
      {this.id,
      this.email,
      this.displayName,
      this.phoneNumber,
      this.photoUrl,
      this.gender});

  factory SocialUser.fromMap(Map<String, dynamic> data, String documentId) {
    if (data == null) {
      return null;
    }
    String uid = data['uid'];
    String name = data['name'];
    String email = data['email'];
    String number = data['number'];
    String imageUrl = data['image_url'];
    String gender = data['gender'];

    return SocialUser(
        id: uid,
        email: email,
        displayName: name,
        phoneNumber: number,
        photoUrl: imageUrl,
        gender: gender);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': displayName,
      'email': email,
      'number': phoneNumber,
      'image_url': photoUrl,
      'gender': gender,
    };
  }
}
