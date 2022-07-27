import 'dart:typed_data';

class ConvUser {
  final String id;
  final String name;
  final String email;
  final String? bio;
  final Uint8List? image;
  final String? imgId;

  ConvUser({
    required this.id,
    required this.name,
    required this.email,
    this.bio,
    this.image,
    this.imgId,
  });

  ConvUser copyWith({
    String? id,
    String? name,
    String? email,
    String? bio,
    Uint8List? image,
    String? imgId,
  }) {
    return ConvUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      bio: bio ?? this.bio,
      image: image ?? this.image,
      imgId: imgId ?? this.imgId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'bio': bio,
      'imgId': imgId,
    };
  }

  factory ConvUser.fromMap(Map<String, dynamic> map) {
    return ConvUser(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      bio: map['bio'],
      imgId: map['imgId'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConvUser &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.bio == bio &&
        other.image == image &&
        other.imgId == imgId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        bio.hashCode ^
        image.hashCode ^
        imgId.hashCode;
  }
}
