import 'package:todo_app/core/app_library.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    if (!mounted) return;

    3.seconds.delay.then((value) {
      context.pushReplacement(ApplicationPaths.loginPage);
    });
  }

  @override
  Widget build(BuildContext context) {
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
