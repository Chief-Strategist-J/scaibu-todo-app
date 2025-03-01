import 'package:cached_network_image/cached_network_image.dart';
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
              if (userCredentials.getFirebasePhotoUrl.validate().isEmpty)
                const CircleAvatar(radius: 40)
              else
                CachedNetworkImage(
                  imageUrl: userCredentials.getFirebasePhotoUrl!,
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
