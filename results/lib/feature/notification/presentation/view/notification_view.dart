import 'package:todo_app/core/app_library.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(final BuildContext context) {
    context.read<NotificationBloc>().add(InitNotificationEvent());

    return Scaffold(
      appBar:
          AppBar(title: Text('Notifications', style: boldTextStyle(size: 16))),
      body: AnimatedScrollView(
        children: const <Widget>[],
      ),
    );
  }
}
