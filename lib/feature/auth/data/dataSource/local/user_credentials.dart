import 'package:todo_app/core/app_library.dart';

final userCredentials = getIt<UserCredentials>();

class UserCredentials {
  static const userName = 'name';
  static const email = 'email';
  static const id = 'id';
  static const accessToken = 'accessToken';
  static const isLogin = '_isLogin';

  static const firebasePhotoUrl = 'firebasePhotoUrl';
  static const firstName = '_firstName';
  static const lastName = '_lastName';
  static const phone = '_phone';
  static const birthDate = '_birthDate';
  static const address = '_address';
  static const city = '_city';
  static const state = '_state';
  static const country = '_country';
  static const zipCode = '_zipCode';
  static const bio = '_bio';

  final Box<dynamic> box;

  UserCredentials(this.box);

  num? get getUserId => box.get(UserCredentials.id);

  String? get getFirebasePhotoUrl => box.get(UserCredentials.firebasePhotoUrl);

  bool? get getIsLogin => box.get(UserCredentials.isLogin);

  String? get getUserName => box.get(UserCredentials.userName);

  String? get getUserEmail => box.get(UserCredentials.email);

  String? get getUserAccessToken => box.get(UserCredentials.accessToken);

  String? get getFirstName => box.get(UserCredentials.firstName);

  String? get getLastName => box.get(UserCredentials.lastName);

  String? get getPhone => box.get(UserCredentials.phone);

  String? get getBirthDate => box.get(UserCredentials.birthDate);

  String? get getAddress => box.get(UserCredentials.address);

  String? get getCity => box.get(UserCredentials.city);

  String? get getState => box.get(UserCredentials.state);

  String? get getCountry => box.get(UserCredentials.country);

  String? get getZipCode => box.get(UserCredentials.zipCode);

  String? get getBio => box.get(UserCredentials.bio);

  void clear() {
    box.delete(userName);
    box.delete(email);
    box.delete(id);
    box.delete(accessToken);
    box.delete(isLogin);
    box.delete(firebasePhotoUrl);
    box.delete(firstName);
    box.delete(lastName);
    box.delete(phone);
    box.delete(birthDate);
    box.delete(address);
    box.delete(city);
    box.delete(state);
    box.delete(country);
    box.delete(zipCode);
    box.delete(bio);
  }
}
