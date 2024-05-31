import 'package:todo_app/core/todo_library.dart';

InitialSetup initialSetup = InitialSetup();

class InitialSetup {
  Future<void> firebaseInit() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> utilityInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initialize();
  }
}
