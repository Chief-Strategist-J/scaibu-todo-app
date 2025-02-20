import 'package:todo_app/core/app_library.dart';

/// Doc Required
class SplashPage extends HookWidget {
  /// Doc Required
  const SplashPage({super.key});

  Future<void> _init(
    final BuildContext context,
    final TodoAuthBloc authBloc,
  ) async {
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!context.mounted) {
        return;
      }
      final String accessToken = userCredentials.getUserAccessToken.validate();

      if (accessToken.isEmpty) {
        await GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage);
        return;
      }

      /// Although the user may be offline and still able to access the app,
      /// there is a possibility that their account data
      /// could have been updated, or the user might have been removed or
      /// blocked while they were offline. To ensure that
      /// the user does not gain unauthorized access under these circumstances,
      /// we proactively request their user data again.
      /// This additional check helps us verify their current status and
      /// prevent login if their account has been altered or disabled.

      final Map<String, num?> getUserDetailReq = <String, num?>{
        'user_id': userCredentials.getUserId,
      };
      final Either<Failure, Either<FailResponse, LoginEntity>> user =
          await getIt<GetUserDetailUseCase>().call(getUserDetailReq);
      if (!context.mounted) {
        return;
      }

      await user.fold(
        (final _) => GoRouter.of(context)
            .pushReplacement(ApplicationPaths.todoListViewPage),
        (final Either<FailResponse, LoginEntity> result) => result.fold(
          (final _) =>
              GoRouter.of(context).pushReplacement(ApplicationPaths.loginPage),
          (final _) => GoRouter.of(context)
              .pushReplacement(ApplicationPaths.todoListViewPage),
        ),
      );
    } catch (e) {
      log('Error during initialization: $e');
    }
  }

  void _initAsync(
      final BuildContext context, final TodoAuthBloc authBloc) async {
    await _init(context, authBloc);
  }

  @override
  Widget build(final BuildContext context) {
    final TodoAuthBloc authBloc =
        useMemoized(() => context.read<TodoAuthBloc>());

    useEffect(
      () {
        _initAsync(
          context,
          authBloc,
        );
        return null;
      },
      <Object?>[],
    );

    return Scaffold(
      body: Center(
        child: Text(
          'Todo Application',
          style: boldTextStyle(size: 10, weight: FontWeight.w900),
        ),
      ),
    );
  }
}
