class UserProfileModel {
  final String email;
  final String name;
  final String uid;
  final String bio;
  final String link;
  final bool hasAvatar;

  UserProfileModel({
    required this.email,
    required this.name,
    required this.uid,
    required this.bio,
    required this.link,
    required this.hasAvatar,
  });

  UserProfileModel.empty()
      : uid = "",
        email = "",
        name = "",
        bio = "",
        link = "",
        hasAvatar = false;

  UserProfileModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        name = json['name'],
        bio = json['bio'],
        link = json['link'],
        hasAvatar = json['hasAvatar'];

  Map<String, String> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'link': link,
    };
  }

  UserProfileModel copyWith({
    String? email,
    String? name,
    String? uid,
    String? bio,
    String? link,
    bool? hasAvatar,
  }) {
    return UserProfileModel(
      email: email ?? this.email,
      name: name ?? this.name,
      uid: uid ?? this.uid,
      bio: bio ?? this.bio,
      link: link ?? this.link,
      hasAvatar: hasAvatar ?? this.hasAvatar,
    );
  }
}
