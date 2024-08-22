// ignore_for_file: prefer_const_constructors

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/core/app_library.dart';

class PomodoroPage extends StatelessWidget {
  const PomodoroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.cardColor,
        centerTitle: true,
        title: Text("Pomodoro", style: boldTextStyle(color: context.primaryColor, size: 18)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: context.primaryColor),
          onPressed: () {
            //
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined, color: context.primaryColor),
            onPressed: () {
              //
            },
          )
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          TimerWidget(
            sessionCount: 2,
            sessionDuration: Duration(minutes: 1),
            onSessionEnd: (e) {
              toast("value");
            },
          ),
        ],
      ),
    );
  }
}

class TimerWidget extends HookWidget {
  final int sessionCount;
  final Duration sessionDuration;
  final Function(int)? onSessionEnd;

  const TimerWidget({
    super.key,
    required this.sessionCount,
    required this.sessionDuration,
    this.onSessionEnd,
  });

  @override
  Widget build(BuildContext context) {
    final totalSeconds = sessionDuration.inSeconds;
    final secondsRemaining = useState(totalSeconds);
    final sessionsCompleted = useState(0);
    final currentSession = useState(1);
    final isRunning = useState(false);
    final dynamicSessionCount = useState(sessionCount); // To handle added sessions

    final timer = useRef<Timer?>(null);

    useEffect(() {
      return () {
        timer.value?.cancel();
      };
    }, []);

    void startTimer() {
      if (isRunning.value) {
        timer.value?.cancel();
        isRunning.value = false;
      } else {
        isRunning.value = true;
        timer.value = Timer.periodic(Duration(seconds: 1), (timer) {
          if (secondsRemaining.value > 0) {
            secondsRemaining.value--;
          } else {
            timer.cancel();
            isRunning.value = false;
            sessionsCompleted.value++;
            onSessionEnd?.call(sessionsCompleted.value); // Trigger callback with sessions completed count

            if (currentSession.value < dynamicSessionCount.value) {
              currentSession.value++;
              secondsRemaining.value = totalSeconds;
              startTimer(); // Automatically start the next session
            } else {
              // All sessions completed
              // You could add a completion sound or notification here
            }
          }
        });
      }
    }

    void resetTimer() {
      timer.value?.cancel();
      isRunning.value = false;
      secondsRemaining.value = totalSeconds;
      sessionsCompleted.value = 0;
      currentSession.value = 1;
    }

    void skipSession() {
      timer.value?.cancel();
      isRunning.value = false;
      if (currentSession.value < dynamicSessionCount.value) {
        currentSession.value++;
        secondsRemaining.value = totalSeconds;
        startTimer(); // Automatically start the next session
      }
    }

    void addSession() {
      dynamicSessionCount.value++; // Increase the total session count
    }

    String timerText() {
      int minutes = secondsRemaining.value ~/ 60;
      int seconds = secondsRemaining.value % 60;
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: context.cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: context.height() * 0.4,
                decoration: BoxDecoration(
                  color: context.primaryColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.elliptical(600, 200),
                    topLeft: Radius.elliptical(600, 200),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 8,
                        alignment: WrapAlignment.center,
                        children: [
                          AppButton(
                            onTap: startTimer,
                            text: isRunning.value ? 'Pause' : 'Start',
                            color: context.cardColor,
                            textColor: context.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          AppButton(
                            onTap: resetTimer,
                            text: 'Reset',
                            color: context.cardColor,
                            textColor: context.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          AppButton(
                            onTap: skipSession,
                            text: 'Skip',
                            color: context.cardColor,
                            textColor: context.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          AppButton(
                            onTap: addSession,
                            text: 'Add Session',
                            color: context.cardColor,
                            textColor: context.primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                            shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ],
                      ),
                    ),
                    36.height,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: context.width() * 0.09,
            top: context.height() * 0.25,
            width: 340,
            height: 340,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(600),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(600)),
                child: CircularPercentIndicator(
                  arcBackgroundColor: context.primaryColor,
                  fillColor: context.primaryColor,
                  arcType: ArcType.FULL_REVERSED,
                  radius: 150,
                  lineWidth: 15,
                  percent: secondsRemaining.value / totalSeconds,
                  progressColor: context.cardColor,
                  backgroundColor: context.primaryColor.withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                  animation: true,
                  animateFromLastPercent: true,
                  center: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        timerText(),
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '${currentSession.value} of ${dynamicSessionCount.value} sessions',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: context.primaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
