import 'package:todo_app/core/app_library.dart';

class UserCredentials {
  UserCredentials(this.box);

  final String userName = 'name';
  final String email = 'email';
  final String id = 'id';
  final String accessToken = 'accessToken';
  final String isLogin = '_isLogin';

  final String firebasePhotoUrl = 'firebasePhotoUrl';
  final String firstName = '_firstName';
  final String lastName = '_lastName';
  final String phone = '_phone';
  final String birthDate = '_birthDate';
  final String address = '_address';
  final String city = '_city';
  final String state = '_state';
  final String country = '_country';
  final String zipCode = '_zipCode';
  final String bio = '_bio';

  final Box<dynamic> box;

  final String tokenSavedTime = 'tokenSavedTime';

  num? get getUserId => box.get(userCredentials.id) as num?;

  String? get getFirebasePhotoUrl =>
      box.get(userCredentials.firebasePhotoUrl) as String?;

  bool? get getIsLogin => box.get(userCredentials.isLogin) as bool?;

  String? get getUserName => box.get(userCredentials.userName) as String?;

  String? get getUserEmail => box.get(userCredentials.email) as String?;

  String? get getUserAccessToken =>
      box.get(userCredentials.accessToken) as String?;

  String? get getFirstName => box.get(userCredentials.firstName) as String?;

  String? get getLastName => box.get(userCredentials.lastName) as String?;

  String? get getPhone => box.get(userCredentials.phone) as String?;

  String? get getBirthDate => box.get(userCredentials.birthDate) as String?;

  String? get getAddress => box.get(userCredentials.address) as String?;

  String? get getCity => box.get(userCredentials.city) as String?;

  String? get getState => box.get(userCredentials.state) as String?;

  String? get getCountry => box.get(userCredentials.country) as String?;

  String? get getZipCode => box.get(userCredentials.zipCode) as String?;

  String? get getBio => box.get(userCredentials.bio) as String?;

  Future<void> clear() async {
    await box.delete(userName);
    await box.delete(email);
    await box.delete(id);
    await box.delete(accessToken);
    await box.delete(isLogin);
    await box.delete(firebasePhotoUrl);
    await box.delete(firstName);
    await box.delete(lastName);
    await box.delete(phone);
    await box.delete(birthDate);
    await box.delete(address);
    await box.delete(city);
    await box.delete(state);
    await box.delete(country);
    await box.delete(zipCode);
    await box.delete(bio);
  }
}
