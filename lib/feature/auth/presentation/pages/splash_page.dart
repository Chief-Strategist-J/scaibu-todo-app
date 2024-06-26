import 'package:todo_app/core/app_library.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  void init(BuildContext context, AuthBloc authBloc) async {
    await 1.seconds.delay;
    await UserCredentials.getUserAccessToken.then((token) {
      if (token.validate().isNotEmpty) {
        context.pushReplacement(ApplicationPaths.todoListViewPage);
      } else {
        context.pushReplacement(ApplicationPaths.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = useMemoized(() => GetIt.instance<AuthBloc>());

    useEffect(() {
      init(context, authBloc);
      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Text(
          "Todo Application",
          style: boldTextStyle(size: 10, weight: FontWeight.w900),
        ),
      ),
    );
  }
}
