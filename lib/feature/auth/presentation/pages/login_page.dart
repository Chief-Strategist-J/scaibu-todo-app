import 'package:todo_app/core/app_library.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  Future<void> onLoginOrSignUpTap(AuthBloc authBloc, AuthFormState authFormState, bool isSignUp) async {
    if (!authFormState.validatorKey.currentState!.validate()) {
      return;
    }

    final Map<String, dynamic> loginReq = {
      "name": authFormState.nameController.text,
      "email": authFormState.emailController.text,
      "password": authFormState.passwordController.text,
      "is_sign_up": isSignUp,
    };

    await getIt<LoginUseCase>().call(loginReq);
    authBloc.add(AuthInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = useMemoized(() => GetIt.instance<AuthBloc>(), []);
    final authFormState = useMemoized(() => Provider.of<AuthFormState>(context));

    useEffect(() {
      //
      return null;
    }, [
      [authBloc]
    ]);

    return Scaffold(
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(16),
            child: CustomScrollView(
              slivers: [
                Form(
                  key: authFormState.validatorKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        64.height,
                        AppTextField(
                          textFieldType: TextFieldType.EMAIL,
                          controller: authFormState.emailController,
                          focus: authFormState.emailFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          enableSuggestions: true,
                          autoFillHints: const [
                            AutofillHints.name,
                            AutofillHints.email,
                          ],
                          decoration: InputDecoration(
                            label: Text(
                              'Email',
                              style: boldTextStyle(size: 10),
                            ),
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
                        ),
                        24.height,
                        AuthCustomButton(
                          text: 'Sign-In',
                          onPress: () async {
                            authBloc.add(AuthSignInEvent());
                            onLoginOrSignUpTap(authBloc, authFormState, false).then((value) {
                              context.pushReplacement(ApplicationPaths.todoListViewPage);
                            });
                          },
                        ),
                        24.height,
                        const CustomDivider(),
                        24.height,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(googleLogo, width: 60, height: 60).cornerRadiusWithClipRRect(60),
                            16.width,
                            Text("or", style: primaryTextStyle(size: 12)),
                            16.width,
                            Image.asset(facebookLogo, width: 60, height: 60).cornerRadiusWithClipRRect(60),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class AuthFormState extends ChangeNotifier {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final validatorKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    userNameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }
}
