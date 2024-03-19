import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoulder_rehabilitation/app/presentation/screens/home_screen.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';

import '../../../core/utils/components.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    super.key,
  });

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  statrDelay() {
    timer = Timer(
      Duration(seconds: 4),
      () => NavAndFinish(context, HomeScreen()),
    );
  }

  @override
  @override
  void initState() {
    super.initState();
    statrDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text('Shoulder rehabilitation',
                    style: TextStyles.stylebold30),
              ),
              SizedBox(height: context.height * 0.04),
            ],
          ),
        ),
      ],
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Image.asset(
      'assets/images/logo.jpg',
      fit: BoxFit.cover,
      height: size.height,
      width: size.width,
    );
  }
}
