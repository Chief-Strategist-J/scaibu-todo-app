import 'package:todo_app/core/app_library.dart';

/// Doc Required
class DrawerHeaderComponent extends StatelessWidget {
  /// Doc Required
  const DrawerHeaderComponent({super.key});

  @override
  Widget build(final BuildContext context) => DrawerHeader(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              if (userCredentials.getFirebasePhotoUrl == null)
                const CircleAvatar(radius: 40)
              else
                Image.network(
                  userCredentials.getFirebasePhotoUrl!,
                  width: 40,
                  height: 40,
                ),
              16.height,
              if (userCredentials.getUserEmail != null)
                Text(
                  userCredentials.getUserEmail!
                      .capitalizeFirstLetter()
                      .splitBefore('@'),
                  style: boldTextStyle(),
                ),
            ],
          ),
        ),
      );
}
