import 'package:todo_app/core/app_library.dart';



class  UserCredentials {
  final userName = 'name';
  final email = 'email';
  final id = 'id';
  final accessToken = 'accessToken';
  final isLogin = '_isLogin';

  final firebasePhotoUrl = 'firebasePhotoUrl';
  final firstName = '_firstName';
  final lastName = '_lastName';
  final phone = '_phone';
  final birthDate = '_birthDate';
  final address = '_address';
  final city = '_city';
  final state = '_state';
  final country = '_country';
  final zipCode = '_zipCode';
  final bio = '_bio';

  final Box<dynamic> box;

  UserCredentials(this.box);

  num? get getUserId => box.get(userCredentials.id);

  String? get getFirebasePhotoUrl => box.get(userCredentials.firebasePhotoUrl);

  bool? get getIsLogin => box.get(userCredentials.isLogin);

  String? get getUserName => box.get(userCredentials.userName);

  String? get getUserEmail => box.get(userCredentials.email);

  String? get getUserAccessToken => box.get(userCredentials.accessToken);

  String? get getFirstName => box.get(userCredentials.firstName);

  String? get getLastName => box.get(userCredentials.lastName);

  String? get getPhone => box.get(userCredentials.phone);

  String? get getBirthDate => box.get(userCredentials.birthDate);

  String? get getAddress => box.get(userCredentials.address);

  String? get getCity => box.get(userCredentials.city);

  String? get getState => box.get(userCredentials.state);

  String? get getCountry => box.get(userCredentials.country);

  String? get getZipCode => box.get(userCredentials.zipCode);

  String? get getBio => box.get(userCredentials.bio);

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
