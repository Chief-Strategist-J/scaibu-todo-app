import 'package:todo_app/core/app_library.dart';

abstract interface class UserProfilePictureRepository {
  Future<void> addProfilePicture(final String userID, final File file);

  Future<void> updateProfilePicture(final String userID, final File file);

  Future<void> deleteProfilePicture(final String userID);
}
