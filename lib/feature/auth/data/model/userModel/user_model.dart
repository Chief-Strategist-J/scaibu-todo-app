//
// import 'package:todo_app/core/app_library.dart';
//
// class UserModel extends UserEntity {
//   UserModel({
//     super.id,
//     super.firebaseUserDetailsId,
//     super.userId,
//     super.firstName,
//     super.lastName,
//     super.email,
//     super.phone,
//     super.birthdate,
//     super.address,
//     super.city,
//     super.state,
//     super.country,
//     super.zipcode,
//     super.avatar,
//     super.bio,
//   });
//
//   factory UserModel.fromJson(dynamic json) {
//     return UserModel(
//       id: json['id'],
//       firebaseUserDetailsId: json['firebase_user_details_id'],
//       userId: json['user_id'],
//       firstName: json['first_name'],
//       lastName: json['last_name'],
//       email: json['email'],
//       phone: json['phone'],
//       birthdate: json['birthdate'],
//       address: json['address'],
//       city: json['city'],
//       state: json['state'],
//       country: json['country'],
//       zipcode: json['zipcode'],
//       avatar: json['avatar'],
//       bio: json['bio'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firebase_user_details_id': firebaseUserDetailsId,
//       'user_id': userId,
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'phone': phone,
//       'birthdate': birthdate,
//       'address': address,
//       'city': city,
//       'state': state,
//       'country': country,
//       'zipcode': zipcode,
//       'avatar': avatar,
//       'bio': bio,
//     };
//   }
// }

import 'package:todo_app/core/app_library.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel, UserEntityMixin {
  const UserModel._(); // Add this line

  const factory UserModel({
    @override num? id,
    @override String? firebaseUserDetailsId,
    num? userId,
    @override String? firstName,
    @override String? lastName,
    @override String? email,
    @override String? phone,
    @override String? birthdate,
    @override String? address,
    @override String? city,
    @override String? state,
    @override String? country,
    @override String? zipcode,
    @override String? avatar,
    @override String? bio,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}
