import 'package:todo_app/core/app_library.dart';

/// Doc Required
class DrawerItemModel {
  /// Doc Required
  DrawerItemModel({required this.title, required this.onTap});

  /// Doc Required
  final String title;

  /// Doc Required
  final void Function() onTap;

  /// Doc Required
  static List<DrawerItemModel> itemList(final BuildContext context) =>
      <DrawerItemModel>[
        DrawerItemModel(
          title: 'Log-Out',
          onTap: () async {
            await await appShowConfirmDialogCustom(
              context,
              title: 'Confirm Log-Out?',
              dialogType: DialogType.DELETE,
              backgroundColor: context.primaryColor,
              cancelButtonColor: cancelButtonColor,
              negativeTextColor: context.primaryColor,
              positiveText: 'Log-Out',
              onAccept: (final BuildContext p0) async {
                await getIt<StandardLogoutUseCase>().call(
                  <String, String>{
                    'user_id': userCredentials.getUserId.toString(),
                    'email': userCredentials.getUserEmail.toString(),
                  },
                );
                // await OneSignal.logout();
                await userCredentials.clear();

                await 1.seconds.delay;
                if (!context.mounted) {
                  return;
                }
                await GoRouter.of(context)
                    .pushReplacement(ApplicationPaths.loginPage);
              },
            );
          },
        ),
        DrawerItemModel(
          title: 'Add Task',
          onTap: () async {
            finish(context);
            await GoRouter.of(context).push(
              ApplicationPaths.manageTodoPage,
            );
          },
        ),
        DrawerItemModel(
          title: 'Chat',
          onTap: () async {
            if (context.mounted) {
              await context.push(ApplicationPaths.chatScreen);
            }
          },
        ),
        DrawerItemModel(
          title: 'Notifications',
          onTap: () async => context.push(ApplicationPaths.notificationPage),
        ),
        DrawerItemModel(
          title: 'Projects',
          onTap: () async {
            await context.push(ApplicationPaths.listOfProjectScreen);
          }, // Add functionality here
        ),
        DrawerItemModel(
          title: 'Settings',
          onTap: () async => context.push(ApplicationPaths.settingPage),
        ),
        DrawerItemModel(
          title: 'Profile',
          onTap: () async {
            finish(context);
            await GoRouter.of(context).push(ApplicationPaths.profilePage);
          },
        ),
      ];
}
