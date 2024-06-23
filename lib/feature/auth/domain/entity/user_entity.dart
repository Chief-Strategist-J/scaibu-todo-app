class UserEntity {
  num? id;
  String? firebaseUserDetailsId;
  num? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? birthdate;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? avatar;
  String? bio;

  UserEntity({
    this.id,
    this.firebaseUserDetailsId,
    this.userId,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.birthdate,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.avatar,
    this.bio,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          firebaseUserDetailsId == other.firebaseUserDetailsId &&
          userId == other.userId &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          email == other.email &&
          phone == other.phone &&
          birthdate == other.birthdate &&
          address == other.address &&
          city == other.city &&
          state == other.state &&
          country == other.country &&
          zipcode == other.zipcode &&
          avatar == other.avatar &&
          bio == other.bio;

  @override
  int get hashCode {
    return id.hashCode ^ firebaseUserDetailsId.hashCode ^ userId.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ phone.hashCode ^ birthdate.hashCode ^ address.hashCode ^ city.hashCode ^ state.hashCode ^ country.hashCode ^ zipcode.hashCode ^ avatar.hashCode ^ bio.hashCode;
  }

  UserEntity copyWith({
    num? id,
    String? firebaseUserDetailsId,
    num? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? birthdate,
    String? address,
    String? city,
    String? state,
    String? country,
    String? zipcode,
    String? avatar,
    String? bio,
  }) {
    return UserEntity(
      id: id ?? this.id,
      firebaseUserDetailsId: firebaseUserDetailsId ?? this.firebaseUserDetailsId,
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      birthdate: birthdate ?? this.birthdate,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipcode: zipcode ?? this.zipcode,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
    );
  }
}
