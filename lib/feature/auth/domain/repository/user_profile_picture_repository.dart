import 'package:todo_app/core/app_library.dart';

abstract interface class UserProfilePictureRepository {
  Future<void> addProfilePicture(String userID, File file);

  Future<void> updateProfilePicture(String userID, File file);

  Future<void> deleteProfilePicture(String userID);
}
