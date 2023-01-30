import 'package:base_flutter_app/src/pages/pawan_ui/task_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController lottieController;

  @override
  void initState() {
    lottieController = AnimationController(vsync: this);

    lottieController.addStatusListener((status) async {
      // if (status == AnimationStatus.completed) {
      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/successfully-done.json",
              height: 300,
              width: 300,
              animate: true,
              controller: lottieController,
              onLoaded: (composition) {
                lottieController
                  ..duration = composition.duration
                  ..forward().whenComplete(
                    () => Navigator.pushAndRemoveUntil<dynamic>(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => const TaskListScreen(),
                      ),
                          (route) => false,//if you want to disable back feature set to false
                    )
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}
