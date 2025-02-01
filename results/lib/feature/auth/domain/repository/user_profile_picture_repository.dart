import 'package:todo_app/core/app_library.dart';
/// Doc Required
abstract interface class UserProfilePictureRepository {
  /// Doc Required
  Future<void> addProfilePicture(final String userID, final File file);
  /// Doc Required
  Future<void> updateProfilePicture(final String userID, final File file);
  /// Doc Required
  Future<void> deleteProfilePicture(final String userID);
}
