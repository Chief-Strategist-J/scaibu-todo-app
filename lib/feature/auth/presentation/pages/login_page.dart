import 'package:todo_app/core/app_library.dart';
import 'package:todo_app/core/constants/images.dart';
import 'package:todo_app/feature/auth/domain/useCases/login_use_case.dart';
import 'package:todo_app/feature/auth/presentation/bloc/auth/auth_state.dart';
import 'package:todo_app/feature/auth/presentation/widget/customButton/auth_custom_button.dart';

class LoginPage extends HookWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final userNameFocusNode = useFocusNode();
    final emailFocusNode = useFocusNode();
    final passwordFocusNode = useFocusNode();

    final authBloc = useMemoized(() => GetIt.instance<AuthBloc>(), []);

    useEffect(() {
      Future.microtask(() => authBloc.add(AuthSingUpEvent()));
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
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      64.height,
                      if (state is SignUpState)
                        AppTextField(
                          textFieldType: TextFieldType.NAME,
                          controller: userNameController,
                          focus: userNameFocusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.name,
                          enableSuggestions: true,
                          autoFillHints: const [
                            AutofillHints.name,
                            AutofillHints.familyName,
                            AutofillHints.namePrefix,
                            AutofillHints.nameSuffix,
                          ],
                          decoration: InputDecoration(
                            label: Text(
                              'User name',
                              style: boldTextStyle(size: 10),
                            ),
                          ),
                        ),
                      24.height,
                      AppTextField(
                        textFieldType: TextFieldType.EMAIL,
                        controller: emailController,
                        focus: emailFocusNode,
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
                        controller: passwordController,
                        focus: passwordFocusNode,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: boldTextStyle(size: 10),
                          ),
                        ),
                      ),
                      24.height,
                      if (state is SignUpState)
                        AuthCustomButton(
                          text: 'Sign-Up',
                          onPress: () {
                            //
                          },
                        ),
                      if (state is SignUpState) 12.height,
                      if (state is SignUpState) _customDivider(context),
                      12.height,
                      AuthCustomButton(
                        text: 'Sign-In',
                        onPress: () async {
                          authBloc.add(AuthSignInEvent());
                          final loginUseCase = getIt<LoginUseCase>();
                          // await loginUseCase.call(
                          //   {
                          //     "name": userNameController.text,
                          //     "email": emailController.text,
                          //     "password": passwordController.text,
                          //     "is_sign_up": false,
                          //   },
                          // );
                        },
                      ),
                      24.height,
                      _customDivider(context),
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
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Row _customDivider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: context.width() * 0.3,
          color: context.dividerColor,
          height: 0.5,
        ),
        8.width,
        Text("or", style: primaryTextStyle(size: 12)),
        8.width,
        Container(
          width: context.width() * 0.3,
          color: context.dividerColor,
          height: 0.5,
        ),
      ],
    );
  }
}
