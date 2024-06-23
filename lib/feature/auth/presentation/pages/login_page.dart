import 'package:todo_app/core/app_library.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  64.height,
                  AppTextField(textFieldType: TextFieldType.NAME),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
