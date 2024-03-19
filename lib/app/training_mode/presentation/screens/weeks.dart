import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/active.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/active_assisted.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/passive_screen.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/phases_screen.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/polymetric.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/strengthening.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
class Weeks extends StatefulWidget {
  const Weeks({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<Weeks> createState() => _WeeksState();
}

class _WeeksState extends State<Weeks> {    late StreamSubscription subscription;
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
      return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: context.width * 1,
                      height: context.height * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade100,
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                                widget.id == 1
                                    ? 'Phase 1'
                                    : widget.id == 2
                                        ? 'Phase 1'
                                        : widget.id == 3
                                            ? "Phase 2"
                                            : widget.id == 3
                                                ? "Phase 3"
                                                : "Phase 3",
                                style: TextStyles.styleblack20),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Row(
                                        children: [
                                          Icon(
                                              Icons.calendar_view_day_outlined),
                                          AutoSizeText(
                                            widget.id == 1
                                                ? '0-3  Weeks'
                                                : widget.id == 2
                                                    ? '3-6  Weeks'
                                                    : widget.id == 3
                                                        ? "6-12  Weeks"
                                                        : widget.id == 3
                                                            ? "12-24  Weeks"
                                                            : "12-24  Weeks",
                                            style: TextStyles.styleblackBold15,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  (widget.id == 1 || widget.id == 2 || widget.id == 3)
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                PassiveScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Passive Exercises",
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
                        )
                      : SizedBox.shrink(),
                  (widget.id == 1 || widget.id == 2 || widget.id == 3)
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                ActiveAssistedScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Active Assisted Exercises",
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
                        )
                      : SizedBox.shrink(),
                  (widget.id == 1 || widget.id == 2 || widget.id == 3)
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                StrengtheningScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Strengthening Exercises",
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
                        )
                      : SizedBox.shrink(),
                  widget.id == 3
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                activeScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Active Exercises",
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
                        )
                      : SizedBox.shrink(),
                  widget.id == 3
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                activeScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Stretch Exercises",
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
                        )
                      : SizedBox.shrink(),
                  widget.id == 4
                      ? InkWell(
                          onTap: () {
                            NavTo(
                                context,
                                PolymetricScreen(
                                  id: widget.id,
                                ));
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
                                  AutoSizeText("Polymetric Exercises",
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
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          );
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
    }
