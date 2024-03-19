import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoulder_rehabilitation/app/presentation/controllers/cubit/app_cubit.dart';
import 'package:shoulder_rehabilitation/app/presentation/screens/home_screen.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';

class NormalModeScreen extends StatefulWidget {
  const NormalModeScreen({Key? key}) : super(key: key);

  @override
  State<NormalModeScreen> createState() => _NormalModeScreenState();
}

class _NormalModeScreenState extends State<NormalModeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
    // showConnectedDialogBox(AppCubit.get(context).check);
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
      body: DisplayDataMethode( context));
  }

  void showDialogBox() => showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text('No Connection'),
          content: Text('Please check your internet connectivity'),
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
              : '⚠ sensor is not connected '),
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
