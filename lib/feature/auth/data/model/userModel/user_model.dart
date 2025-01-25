import 'package:todo_app/core/app_library.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel, UserEntityMixin {
  const UserModel._(); // Add this line

  const factory UserModel({
    @override final num? id,
    @override final String? firebaseUserDetailsId,
    final num? userId,
    @override final String? firstName,
    @override final String? lastName,
    @override final String? email,
    @override final String? phone,
    @override final String? birthdate,
    @override final String? address,
    @override final String? city,
    @override final String? state,
    @override final String? country,
    @override final String? zipcode,
    @override final String? avatar,
    @override final String? bio,
  }) = _UserModel;

  factory UserModel.fromJson(final Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
