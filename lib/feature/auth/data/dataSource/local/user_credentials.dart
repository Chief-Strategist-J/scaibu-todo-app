import 'package:todo_app/core/app_library.dart';

class UserCredentials {
  static const userName = 'name';
  static const email = 'email';
  static const id = 'id';
  static const accessToken = 'accessToken';
  static const firebasePhotoUrl = 'firebasePhotoUrl';


  static Future<Box<dynamic>> get getUserBox async {
    return await Hive.openBox('_UserAuthBox_');
  }

  static Future<num?> get getUserId async {
    Box<dynamic> box = await getUserBox;
    return box.get(UserCredentials.id);
  }

  static Future<String?> get getFirebasePhotoUrl async {
    Box<dynamic> box = await getUserBox;
    return box.get(UserCredentials.firebasePhotoUrl);
  }

  static Future<String?> get getUserName async {
    Box<dynamic> box = await getUserBox;
    return box.get(UserCredentials.userName);
  }

  static Future<String?> get getUserEmail async {
    Box<dynamic> box = await getUserBox;
    return box.get(UserCredentials.email);
  }

  static Future<String?> get getUserAccessToken async {
    Box<dynamic> box = await getUserBox;
    return box.get(UserCredentials.accessToken);
  }
}
