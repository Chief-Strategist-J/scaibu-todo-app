import 'package:todo_app/core/app_library.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  Future<void> _init(BuildContext context, AuthBloc authBloc) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (!context.mounted) return;
      final accessToken = userCredentials.getUserAccessToken.validate();

      if (accessToken.isEmpty) {
        GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage);
        return;
      }

      /// Although the user may be offline and still able to access the app, there is a possibility that their account data
      /// could have been updated, or the user might have been removed or blocked while they were offline. To ensure that
      /// the user does not gain unauthorized access under these circumstances, we proactively request their user data again.
      /// This additional check helps us verify their current status and prevent login if their account has been altered or disabled.

      final getUserDetailReq = {"user_id": userCredentials.getUserId};
      final user = await getIt<GetUserDetailUseCase>().call(getUserDetailReq);
      if (!context.mounted) return;

      user.fold(
        (_) => GoRouter.of(context).pushReplacement(ApplicationPaths.todoListViewPage),
        (result) => result.fold(
          (_) => GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage),
          (_) => GoRouter.of(context).pushReplacement(ApplicationPaths.todoListViewPage),
        ),
      );
    } catch (e) {
      log('Error during initialization: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = useMemoized(() => context.read<AuthBloc>());

    useEffect(() {
      _init(context, authBloc);
      return null;
    }, []);

    return Scaffold(body: Center(child: Text("Todo Application", style: boldTextStyle(size: 10, weight: FontWeight.w900))));
  }
}
