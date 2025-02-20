import 'package:todo_app/core/app_library.dart';

/// Doc Required
class LoginPage extends HookWidget {
  /// Doc Required
  const LoginPage({super.key});

  /// Doc Required
  Future<void> onLoginOrSignUpTap(
    final TodoAuthBloc authBloc,
    final AuthFormState authFormState, {
    required final bool isSignUp,
  }) async {
    if (!authFormState.validatorKey.currentState!.validate()) {
      return;
    }

    final Map<String, dynamic> loginReq = <String, dynamic>{
      'name': authFormState.emailController.text,
      'email': authFormState.emailController.text,
      'password': authFormState.passwordController.text,
      'is_sign_up': isSignUp,
    };

    await getIt<LoginUseCase>().call(loginReq);
    authBloc.add(AuthInitEvent());
  }

  @override
  Widget build(final BuildContext context) {
    final TodoAuthBloc authBloc =
        useMemoized(() => context.read<TodoAuthBloc>(), <Object?>[]);
    final AuthFormState authFormState = Provider.of<AuthFormState>(context);
    final ValueNotifier<String> emailText =
        useState(authFormState.emailController.text);

    useEffect(
      () {
        void emailListener() =>
            emailText.value = authFormState.emailController.text;

        authFormState.emailController.addListener(emailListener);
        return () =>
            authFormState.emailController.removeListener(emailListener);
      },
      <Object?>[authFormState.emailController],
    );

    useEffect(
      () {
        afterBuildCreated(() {
          hideKeyboard(context);
        });
        return null;
      },
      <Object?>[],
    );

    return Scaffold(
      restorationId: '_LoginPage',
      body: BlocBuilder<TodoAuthBloc, AuthState>(
        bloc: authBloc,
        builder: (final BuildContext context, final AuthState state) =>
            Container(
          padding: const EdgeInsets.symmetric(horizontal: 34),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Form(
                    key: authFormState.validatorKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('Welcome', style: boldTextStyle(size: 24)),
                        Lottie.asset(
                          Assets.loginPageAssetsWelcome,
                          width: 200,
                          height: 200,
                        ),
                        16.height,
                        AppTextField(
                          textFieldType: TextFieldType.EMAIL,
                          controller: authFormState.emailController,
                          focus: authFormState.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: true,
                          autoFillHints: const <String>[
                            AutofillHints.name,
                            AutofillHints.email,
                          ],
                          decoration: InputDecoration(
                            label:
                                Text('Email', style: boldTextStyle(size: 10)),
                          ),
                        ),
                        24.height,
                        AppTextField(
                          textFieldType: TextFieldType.PASSWORD,
                          controller: authFormState.passwordController,
                          focus: authFormState.passwordFocusNode,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            label: Text(
                              'Password',
                              style: boldTextStyle(size: 10),
                            ),
                          ),
                          onFieldSubmitted: (final String p0) async {
                            await onLoginOrSignUpTap(
                              authBloc,
                              authFormState,
                              isSignUp: false,
                            ).then((final void value) async {
                              authFormState.clear();
                              if (!context.mounted) {
                                return;
                              }
                              await GoRouter.of(context).pushReplacement(
                                ApplicationPaths.todoListViewPage,
                              );
                            });
                          },
                        ),
                        24.height,
                        if (emailText.value.isEmpty) ...<Widget>[
                          const CustomDivider(),
                          24.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(googleLogo, width: 60, height: 60)
                                  .cornerRadiusWithClipRRect(60),
                              16.width,
                              Text('or', style: primaryTextStyle(size: 12)),
                              16.width,
                              Image.asset(facebookLogo, width: 60, height: 60)
                                  .cornerRadiusWithClipRRect(60),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Doc Required
class AuthFormState extends ChangeNotifier {
  /// Doc Required
  final TextEditingController emailController = TextEditingController();

  /// Doc Required
  final TextEditingController passwordController = TextEditingController();

  /// Doc Required
  final FocusNode userNameFocusNode = FocusNode();

  /// Doc Required
  final FocusNode emailFocusNode = FocusNode();

  /// Doc Required
  final FocusNode passwordFocusNode = FocusNode();

  /// Doc Required
  final GlobalKey<FormState> validatorKey = GlobalKey<FormState>();

  /// Doc Required
  void clear() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
