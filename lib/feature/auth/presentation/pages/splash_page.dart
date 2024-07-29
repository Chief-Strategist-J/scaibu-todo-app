import 'package:todo_app/core/app_library.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  void init(BuildContext context, AuthBloc authBloc) async {
    await getIt.isReady<UserCredentials>();
    await 1.seconds.delay.then(
      (value) {
        if (userCredentials.getUserAccessToken.validate().isNotEmpty) {
          GoRouter.of(context).pushReplacement(ApplicationPaths.todoListViewPage);
        } else {
          GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = useMemoized(() => context.read<AuthBloc>());

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
