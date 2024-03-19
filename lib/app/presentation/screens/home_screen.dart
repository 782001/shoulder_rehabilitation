import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoulder_rehabilitation/app/presentation/controllers/cubit/app_cubit.dart';
import 'package:shoulder_rehabilitation/app/presentation/controllers/cubit/app_state.dart';
import 'package:shoulder_rehabilitation/app/presentation/screens/normal_mode_screen.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/phases_screen.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/strings.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() {
              isAlertSet = true;
            });
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      AppCubit.get(context).uploadData(dataList);
                    },
                    icon: Icon(Icons.upcoming_outlined)),
                IconButton(
                    onPressed: () {
                      showConnectedDialogBox(AppCubit.get(context).check);
                    },
                    icon: Icon(Icons.private_connectivity)),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  InkWell(
                    onTap: () {
                      NavTo(context, phases_screen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            AutoSizeText("Training Mode",
                                style: TextStyles.styleblack20),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      NavTo(context, NormalModeScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: context.width * 1,
                        height: context.height * 0.06,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade100,
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            AutoSizeText("Normal Mode",
                                style: TextStyles.styleblack20),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.black,
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  DisplayDataMethode(context)
                ],
              ),
            ),
          );
        });
  }

  void showDialogBox() => showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('No Connection'),
          content: Text('Please check your internet connectivitu'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context, "Cancel");
                setState(() {
                  isAlertSet = false;
                });
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialogBox();
                  setState(() {
                    isAlertSet = true;
                  });
                }
              },
              child: Text('OK'),
            )
          ],
        ),
      );
  void showConnectedDialogBox(String title) => showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          // title: Text('No Connection'),
          content: Text(title == 'sensor is connected '
              ? 'sensor is connected'
              : '⚠ sensor is not connected'),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context, "Cancel");

                // if (title == 'sensor is connected') {
                //   showConnectedDialogBox(AppCubit.get(context).check);
                // }
                // if (title == 'sensor is not connected' || title == '') {
                //   showConnectedDialogBox('⚠ Sensor is not Connected');
                // }
              },
              child: Text('OK'),
            )
          ],
        ),
      );
}

BlocConsumer<AppCubit, AppStates> DisplayDataMethode(BuildContext context) {
  return BlocConsumer<AppCubit, AppStates>(
    listener: (context, state) {},
    builder: (context, state) {
      var cubit = AppCubit.get(context);
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: context.width * .7,
          height: context.height * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade100,
            border: Border.all(
              color: Colors.blue,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        "X :  ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontFamily: cairoFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${cubit.x.toString()}",
                        style: TextStyles.styleblackBold18,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Y :  ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontFamily: cairoFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${cubit.y.toString()}",
                        style: TextStyles.styleblackBold18,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Z :  ",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontFamily: cairoFont,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${cubit.z.toString()}",
                        style: TextStyles.styleblackBold18,
                      ),
                      const Spacer()
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
