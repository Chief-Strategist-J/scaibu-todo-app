import 'package:todo_app/core/app_library.dart';

///
class UserCredentials {
  ///
  UserCredentials(this.box);

  /// User's name.
  final String userName = 'name';

  /// User's email address.
  final String email = 'email';

  /// User's unique identifier.
  final String id = 'id';

  /// User's access token.
  final String accessToken = 'accessToken';

  /// Login status flag.
  final String isLogin = '_isLogin';

  /// User's Firebase photo URL.
  final String firebasePhotoUrl = 'firebasePhotoUrl';

  /// User's first name.
  final String firstName = '_firstName';

  /// User's last name.
  final String lastName = '_lastName';

  /// User's phone number.
  final String phone = '_phone';

  /// User's birth date.
  final String birthDate = '_birthDate';

  /// User's address.
  final String address = '_address';

  /// User's city.
  final String city = '_city';

  /// User's state.
  final String state = '_state';

  /// User's country.
  final String country = '_country';

  /// User's zip code.
  final String zipCode = '_zipCode';

  /// User's biography.
  final String bio = '_bio';

  /// A reference to the storage box used for persisting data.
  final Box<dynamic> box;

  /// Key used for storing the token's saved time in the storage.
  final String tokenSavedTime = 'tokenSavedTime';

  /// Retrieves the user's ID from the storage.
  num? get getUserId => box.get(userCredentials.id) as num?;

  /// Retrieves the user's Firebase photo URL from the storage.
  String? get getFirebasePhotoUrl =>
      box.get(userCredentials.firebasePhotoUrl) as String?;

  /// Retrieves the user's login status from the storage.
  bool? get getIsLogin => box.get(userCredentials.isLogin) as bool?;

  /// Retrieves the user's username from the storage.
  String? get getUserName => box.get(userCredentials.userName) as String?;

  /// Retrieves the user's email from the storage.
  String? get getUserEmail => box.get(userCredentials.email) as String?;

  /// Retrieves the user's access token from the storage.
  String? get getUserAccessToken =>
      box.get(userCredentials.accessToken) as String?;

  /// Retrieves the user's first name from the storage.
  String? get getFirstName => box.get(userCredentials.firstName) as String?;

  /// Retrieves the user's last name from the storage.
  String? get getLastName => box.get(userCredentials.lastName) as String?;

  /// Retrieves the user's phone number from the storage.
  String? get getPhone => box.get(userCredentials.phone) as String?;

  /// Retrieves the user's birth date from the storage.
  String? get getBirthDate => box.get(userCredentials.birthDate) as String?;

  /// Retrieves the user's address from the storage.
  String? get getAddress => box.get(userCredentials.address) as String?;

  /// Retrieves the user's city from the storage.
  String? get getCity => box.get(userCredentials.city) as String?;

  /// Retrieves the user's state from the storage.
  String? get getState => box.get(userCredentials.state) as String?;

  /// Retrieves the user's country from the storage.
  String? get getCountry => box.get(userCredentials.country) as String?;

  /// Retrieves the user's zip code from the storage.
  String? get getZipCode => box.get(userCredentials.zipCode) as String?;

  /// Retrieves the user's bio from the storage.
  String? get getBio => box.get(userCredentials.bio) as String?;

  ///
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
