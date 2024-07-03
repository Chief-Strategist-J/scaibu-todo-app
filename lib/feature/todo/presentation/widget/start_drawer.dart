import 'package:todo_app/core/app_library.dart';

class DrawerComponent extends StatelessWidget {
  final TodoBloc _todoBloc;

  const DrawerComponent({super.key, required TodoBloc todoBloc}) : _todoBloc = todoBloc;

  void _onLogOutTap(BuildContext context) {
    appShowConfirmDialogCustom(
      context,
      title: 'Confirm Log-Out?',
      dialogType: DialogType.DELETE,
      backgroundColor:Colors.white,
      cancelButtonColor: Colors.black,
      negativeTextColor: Colors.white,
      positiveText: "Log-Out",
      onAccept: (p0) {
        userCredentials.clear();
        OneSignal.logout();
        context.pushReplacement(ApplicationPaths.loginPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width() * 0.5,
      child: SizedBox(
        height: context.height(),
        width: context.width(),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: DrawerHeader(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          if (userCredentials.getFirebasePhotoUrl == null) return const CircleAvatar(radius: 40);
                          return Image.network(userCredentials.getFirebasePhotoUrl!, width: 40, height: 40);
                        },
                      ),
                      16.height,
                      Builder(
                        builder: (context) {
                          if (userCredentials.getUserEmail == null) return const CircleAvatar(radius: 40);
                          return Text(
                            userCredentials.getUserEmail!.capitalizeFirstLetter().splitBefore('@'),
                            style: boldTextStyle(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ListView(
                reverse: true,
                children: [
                  64.height,
                  if (_todoBloc.state is! NoInternetState)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () async {
                        _onLogOutTap(context);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        child: Text("Log-Out", style: boldTextStyle()),
                      ),
                    ),
                  const Divider(thickness: 0.5),
                  if (_todoBloc.state is! NoInternetState)
                    GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        finish(context);
                        context.push(ApplicationPaths.manageTodoPage, extra: null);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                        child: Text("Add Task", style: boldTextStyle()),
                      ),
                    ),
                  const Divider(thickness: 0.5),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      finish(context);
                      context.push(ApplicationPaths.profilePage);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      child: Text("Profile", style: boldTextStyle()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
