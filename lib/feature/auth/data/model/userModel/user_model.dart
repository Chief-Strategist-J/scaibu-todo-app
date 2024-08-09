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
