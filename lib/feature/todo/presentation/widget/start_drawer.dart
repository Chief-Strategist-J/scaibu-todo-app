import 'package:todo_app/core/app_library.dart';

class StartDrawer extends StatelessWidget {
  const StartDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.width()*0.5,
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
                      FutureBuilder(
                        future: UserCredentials.getFirebasePhotoUrl,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) return const CircleAvatar(radius: 40);
                          return Image.network(snapshot.data!, width: 40, height: 40);
                        },
                      ),
                      16.height,
                      FutureBuilder(
                        future: UserCredentials.getUserEmail,
                        builder: (context, snapshot) {
                          if (snapshot.data == null) return const CircleAvatar(radius: 40);
                          return Text(
                            snapshot.data!.capitalizeFirstLetter().splitBefore('@'),
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
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      //
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                      child: Text("Log-Out", style: boldTextStyle()),
                    ),
                  ),
                  const Divider(thickness: 0.5),
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
