import 'package:todo_app/core/app_library.dart';

class DrawerItemModel {
  final String title;
  final void Function() onTap;

  DrawerItemModel({required this.title, required this.onTap});

  static List<DrawerItemModel> itemList(BuildContext context) {
    return [
      DrawerItemModel(
        title: 'Log-Out',
        onTap: () {
          appShowConfirmDialogCustom(
            context,
            title: 'Confirm Log-Out?',
            dialogType: DialogType.DELETE,
            backgroundColor: context.primaryColor,
            cancelButtonColor: cancelButtonColor,
            negativeTextColor: context.primaryColor,
            positiveText: "Log-Out",
            onAccept: (p0) async {
              await getIt<StandardLogoutUseCase>().call(
                {
                  'user_id': userCredentials.getUserId.toString(),
                  'email': userCredentials.getUserEmail.toString(),
                },
              );
              OneSignal.logout();
              userCredentials.clear();

              await 1.seconds.delay;
              if (!context.mounted) return;
              GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage);
            },
          );
        },
      ),
      DrawerItemModel(
        title: 'Add Task',
        onTap: () {
          finish(context);
          GoRouter.of(context).push(ApplicationPaths.manageTodoPage, extra: null);
        },
      ),
      DrawerItemModel(
        title: 'Notifications',
        onTap: () => context.push(ApplicationPaths.notificationPage),
      ),
      DrawerItemModel(
        title: 'Projects',
        onTap: () {}, // Add functionality here
      ),
      DrawerItemModel(
        title: 'Settings',
        onTap: () => context.push(ApplicationPaths.settingPage),
      ),
      DrawerItemModel(
        title: 'Profile',
        onTap: () {
          finish(context);
          GoRouter.of(context).push(ApplicationPaths.profilePage);
        },
      ),
    ];
  }
}