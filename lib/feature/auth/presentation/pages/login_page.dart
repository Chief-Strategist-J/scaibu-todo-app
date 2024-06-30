import 'package:lottie/lottie.dart';
import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/generated/assets.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  Future<void> onLoginOrSignUpTap(AuthBloc authBloc, AuthFormState authFormState, bool isSignUp) async {
    if (!authFormState.validatorKey.currentState!.validate()) return;

    final Map<String, dynamic> loginReq = {
      "name": authFormState.emailController.text,
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
    final authFormState = Provider.of<AuthFormState>(context, listen: true);
    final emailText = useState(authFormState.emailController.text);

    useEffect(() {
      void emailListener() => emailText.value = authFormState.emailController.text;

      authFormState.emailController.addListener(emailListener);
      return () => authFormState.emailController.removeListener(emailListener);
    }, [authFormState.emailController]);

    useEffect(() {
      afterBuildCreated(() {
        hideKeyboard(context);
      });
      return null;
    }, []);

    return Scaffold(
      restorationId: "_LoginPage",
      body: BlocBuilder<AuthBloc, AuthState>(
        bloc: authBloc,
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 34),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Form(
                      key: authFormState.validatorKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Welcome", style: boldTextStyle(size: 24)),
                          Lottie.asset(Assets.loginPageAssetsWelcome, width: 200, height: 200),
                          16.height,
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
                              label: Text('Email', style: boldTextStyle(size: 10)),
                            ),
                          ),
                          24.height,
                          AppTextField(
                            textFieldType: TextFieldType.PASSWORD,
                            controller: authFormState.passwordController,
                            focus: authFormState.passwordFocusNode,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              label: Text('Password', style: boldTextStyle(size: 10)),
                            ),
                            onFieldSubmitted: (p0) {
                              onLoginOrSignUpTap(authBloc, authFormState, false).then((value) {
                                authFormState.clear();
                                context.pushReplacement(ApplicationPaths.todoListViewPage);
                              });
                            },
                          ),
                          24.height,
                          if (emailText.value.isEmpty) ...[
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
                          ]
                        ],
                      ),
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
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final userNameFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final validatorKey = GlobalKey<FormState>();

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
