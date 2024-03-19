import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/active.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/active_assisted.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/finish_week_screen.dart';
import 'package:shoulder_rehabilitation/core/utils/app_theme_colors.dart';
import 'package:shoulder_rehabilitation/core/utils/assets_images_path.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StrengtheningScreen extends StatefulWidget {
  const StrengtheningScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  _StrengtheningScreenState createState() => _StrengtheningScreenState();
}

class StrengtheningModel {
  final String image;
  final String title;
//   final String image;
//   final String title;
  final String set;
  final String description;
  final String repetition;

//   PageViewModel(this.image, this.title, );
  StrengtheningModel(
      {required this.image,
      required this.title,
      required this.set,
      required this.description,
      required this.repetition});
}

class _StrengtheningScreenState extends State<StrengtheningScreen> {
  // void Submit() {
  //   CashHelper.SaveData(key: 'onStrengthening', value: true).then((value) {
  //     if (value) {
  //       print('on Strengthening save true');
  //       // NavAndFinish(context, HomeScreen());
  //       // NavAndFinish(context, LoginScreen());
  //       widget.isFromDrawer
  //           ? Navigator.pop(context)
  //           : NavAndFinish(context, LoginScreen());
  //     }
  //   });
  // }
  int seconds = 0;
  late Timer timer;
  int numberOfRepetitions = 0;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        seconds++;
        if (seconds == 15) {
          timer.cancel(); // Stop the timer when it reaches 15 seconds
          numberOfRepetitions++; // Increment the number of repetitions

          // Check if the model.set contains a number
          int repetitionsFromModel = 0;
          if (widget.id == 1) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                strengtheningList0_3[StrengtheningController.page!.round()]
                    .set
                    .replaceAll(RegExp(r'[^0-9]'), ''),
              );
            } catch (e) {
              // Handle the parsing error, for example, by setting repetitionsFromModel to a default value
              repetitionsFromModel = 0;
            }
            if (numberOfRepetitions < repetitionsFromModel) {
              // If the number of repetitions is less than the specified repetitions
              // Start the timer again
              seconds = 0;
              startTimer();
            }
          } else if (widget.id == 2) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                strengtheningList3_6[StrengtheningController.page!.round()]
                    .set
                    .replaceAll(RegExp(r'[^0-9]'), ''),
              );
            } catch (e) {
              // Handle the parsing error, for example, by setting repetitionsFromModel to a default value
              repetitionsFromModel = 0;
            }

            if (numberOfRepetitions < repetitionsFromModel) {
              // If the number of repetitions is less than the specified repetitions
              // Start the timer again
              seconds = 0;
              startTimer();
            }
          } else if (widget.id == 3) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                strengtheningList6_12[StrengtheningController.page!.round()]
                    .set
                    .replaceAll(RegExp(r'[^0-9]'), ''),
              );
            } catch (e) {
              // Handle the parsing error, for example, by setting repetitionsFromModel to a default value
              repetitionsFromModel = 0;
            }
            if (numberOfRepetitions < repetitionsFromModel) {
              // If the number of repetitions is less than the specified repetitions
              // Start the timer again
              seconds = 0;
              startTimer();
            }
          } else if (widget.id == 4) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                strengtheningList12_24[StrengtheningController.page!.round()]
                    .set
                    .replaceAll(RegExp(r'[^0-9]'), ''),
              );
            } catch (e) {
              // Handle the parsing error, for example, by setting repetitionsFromModel to a default value
              repetitionsFromModel = 0;
            }
            if (numberOfRepetitions < repetitionsFromModel) {
              // If the number of repetitions is less than the specified repetitions
              // Start the timer again
              seconds = 0;
              startTimer();
            }
          }
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  late bool isForwardScroll;

  void onPageChanged(int newIndex) {
    setState(() {
      if (newIndex > currentIndex) {
        // Reset the timer only when scrolling to the next index
        seconds = 0;
        numberOfRepetitions = 0;
      }
      currentIndex = newIndex;
    });

    // Only start a new timer if there is no active timer
    if (!timer.isActive) {
      startTimer();
    }
  }

  var StrengtheningController = PageController();
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kwhite,
      // appBar: AppBar(
      //   backgroundColor: AppColors.kwhite,
      //   elevation: 0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.only(top: 20.0, bottom: 20),
                child: Container(
                  width: context.width * 1,
                  height: context.height * 0.12,
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
                                            : "",
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
                                      Icon(Icons.calendar_view_day_outlined),
                                      AutoSizeText(
                                        widget.id == 1
                                            ? '0-3  Weeks'
                                            : widget.id == 2
                                                ? '3-6  Weeks'
                                                : widget.id == 3
                                                    ? "6-12  Weeks"
                                                    : widget.id == 3
                                                        ? "12-24  Weeks"
                                                        : "",
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

              SizedBox(
                height: context.height * 55 / 100,
                child: PageView.builder(
                  controller: StrengtheningController,
                  onPageChanged: (int index) {
                    onPageChanged(index);
                    widget.id == 1 && index == strengtheningList0_3.length - 1
                        ? setState(() {
                            islast = true;
                          })
                        : widget.id == 2 &&
                                index == strengtheningList3_6.length - 1
                            ? setState(() {
                                islast = true;
                              })
                            : widget.id == 3 &&
                                    index == strengtheningList6_12.length - 1
                                ? setState(() {
                                    islast = true;
                                  })
                                : widget.id == 4 &&
                                        index ==
                                            strengtheningList12_24.length - 1
                                    ? setState(() {
                                        islast = true;
                                      })
                                    : setState(() {
                                        islast = false;
                                      });
                    // if (index == strengtheningList0_3.length - 1 ||
                    //     index == strengtheningList3_6.length - 1 ||
                    //     index == strengtheningList6_12.length - 1 ||
                    //     index == strengtheningList12_24.length - 1) {
                    //   setState(() {
                    //     islast = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     islast = false;
                    //   });
                    // }
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Build_Strengthening_Item(
                    widget.id == 1
                        ? strengtheningList0_3[index]
                        : widget.id == 2
                            ? strengtheningList3_6[index]
                            : widget.id == 3
                                ? strengtheningList6_12[index]
                                : widget.id == 4
                                    ? strengtheningList12_24[index]
                                    : strengtheningList12_24[index],
                  ),
                  itemCount: widget.id == 1
                      ? strengtheningList0_3.length
                      : widget.id == 2
                          ? strengtheningList3_6.length
                          : widget.id == 3
                              ? strengtheningList6_12.length
                              : widget.id == 4
                                  ? strengtheningList12_24.length
                                  : 10,
                ),
              ),
              // SizedBox(
              //   height: context.height * .05,
              // ),
              // const Spacer(),
              // SizedBox(
              //   height: context.height * .1,
              // ),
              SmoothPageIndicator(
                controller: StrengtheningController,
                effect: const ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  activeDotColor: Color(0xffF89368),
                  dotWidth: 10,
                ),
                count: widget.id == 1
                    ? strengtheningList0_3.length
                    : widget.id == 2
                        ? strengtheningList3_6.length
                        : widget.id == 3
                            ? strengtheningList6_12.length
                            : widget.id == 4
                                ? strengtheningList12_24.length
                                : 10,
              ),
              SizedBox(
                height: context.height * .03,
              ),
              Container(
                width: context.width * 0.35,
                height: context.height * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: islast ? Colors.blue : Colors.white,
                ),
                child: islast
                    ? ElevatedButton(
                        style: ButtonStyle(
                          //padding: EdgeInsets.all(10.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white)),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              // if the button is pressed the elevation is 10.0, if not
                              // it is 5.0
                              if (states.contains(MaterialState.pressed)) {
                                return 10.0;
                              }
                              return 0;
                            },
                          ),
                          // textColor: Colors.white,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                    color: Colors.blue, width: 2)),
                          ),
                        ),
                        onPressed: () {
                          widget.id == 3
                              ? NavTo(
                                  context,
                                  activeScreen(
                                    id: widget.id,
                                  ))
                              : NavTo(
                                  context,
                                  FinishWeekScreen(
                                    id: widget.id,
                                  ));
                        },
                        child: AutoSizeText(
                          "Ok",
                          style: TextStyles.stylewhitebold20,
                        ),
                      )
                    : ElevatedButton(
                        style: ButtonStyle(
                          //padding: EdgeInsets.all(10.0),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          textStyle: MaterialStateProperty.all(
                              const TextStyle(color: Colors.white)),
                          elevation: MaterialStateProperty.resolveWith<double>(
                            (Set<MaterialState> states) {
                              // if the button is pressed the elevation is 10.0, if not
                              // it is 5.0
                              if (states.contains(MaterialState.pressed)) {
                                return 10.0;
                              }
                              return 0;
                            },
                          ),
                          // textColor: Colors.white,
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                side: const BorderSide(
                                    color: Colors.blue, width: 2)),
                          ),
                        ),
                        onPressed: () {
                          StrengtheningController.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: AutoSizeText(
                          "Next",
                          style: TextStyles.stylewhitebold20,
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Build_Strengthening_Item(StrengtheningModel model) =>
      SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              model.title,
              style: TextStyles.styleellipsisbold20,
              textAlign: TextAlign.start,
              maxLines: 3,
            ),
            const SizedBox(
              height: 7,
            ),
            AutoSizeText(
              model.description,
              style: TextStyles.styleeredllipsis18,
              textAlign: TextAlign.start,
              maxLines: 4,
            ),
            const SizedBox(
              height: 7,
            ),
            Image(
              // fit: BoxFit.contain,
              image: AssetImage(
                model.image,
              ),
              height: context.height * .3,
            ),
            AutoSizeText(
              model.set,
              style: TextStyles.styleellipsis18,
              textAlign: TextAlign.start,
              maxLines: 4,
            ),
            // Spacer(),
            AutoSizeText(
              model.repetition,
              style: TextStyles.styleellipsis18,
              textAlign: TextAlign.start,
              maxLines: 4,
            ),
            model.repetition != ""
                ? CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: AutoSizeText(
                      seconds.toString(),
                      style: TextStyles.stylewhiteBold18,
                      textAlign: TextAlign.start,
                      maxLines: 4,
                    ),
                  )
                : AutoSizeText(
                    "",
                    style: TextStyles.styleellipsis18,
                    textAlign: TextAlign.start,
                    maxLines: 4,
                  ),
          ],
        ),
      );
}

List<StrengtheningModel> strengtheningList0_3 = [
  StrengtheningModel(
      image: strengthening0_3_1,
      title: "",
      set: "",
      repetition: "(10-15)repetition for few seconds.",
      description: "Isometric low row exercise"),
  StrengtheningModel(
      image: strengthening0_3_2,
      title: "",
      set: "",
      repetition: "(10-15)repetition for few seconds.",
      description: "Scapular retraction "),
  StrengtheningModel(
      image: strengthening0_3_3,
      title: "",
      set: "",
      repetition: "(10-15)repetition for few seconds.",
      description: "Scapular inferior glide exercise"),
  StrengtheningModel(
      image: strengthening0_3_4,
      title: "",
      set: "",
      repetition: "(10-15)repetition for few seconds.",
      description: "Scapular orientation"),
];
List<StrengtheningModel> strengtheningList3_6 = [
  StrengtheningModel(
      image: strengthening3_6_1,
      title: "Strength of elbow ",
      set: "",
      repetition: "10 repetition and hold for 5 seconds ",
      description: "submaximal isometric contraction"),
  StrengtheningModel(
      image: strengthening3_6_2,
      title: "Strength of shoulder ",
      set: "",
      repetition: "10 repetition and hold for 5 seconds ",
      description: "submaximal isometric contraction "),
];
List<StrengtheningModel> strengtheningList6_12 = [
  StrengtheningModel(
      image: strengthening6_12_1,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "blank "),
  StrengtheningModel(
      image: strengthening6_12_2,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "side blank "),
  StrengtheningModel(
      image: strengthening6_12_3,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Lawnmower with elastic band"),
  StrengtheningModel(
      image: strengthening6_12_4,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "quadruped push up plus "),
  StrengtheningModel(
      image: strengthening6_12_5,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Resisted shoulder flexion  "),
  StrengtheningModel(
      image: strengthening6_12_6,
      title: "Shoulder strengthening :",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Resisted shoulder external rotation "),
  StrengtheningModel(
      image: strengthening6_12_7,
      title: "",
      set: "3 sets",
      repetition: "15 repetitions twice a day",
      description: "wrist Eccentric Strengthening Exercise "),
  StrengtheningModel(
      image: strengthening6_12_8,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Elbow Flexion and Extension "),
  StrengtheningModel(
      image: strengthening6_12_9,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "	Resisted shoulder internal rotation "),
  StrengtheningModel(
      image: strengthening6_12_10,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "pelvic tilt "),
  StrengtheningModel(
      image: strengthening6_12_11,
      title: "",
      set: "3 sets",
      repetition: "15 repetitions twice a day ",
      description: "wrist Concentric Strengthening Exercise "),
  StrengtheningModel(
      image: strengthening6_12_12,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Quadruped push up "),
  StrengtheningModel(
      image: strengthening6_12_13,
      title: "",
      set: "3 sets",
      repetition: "Repeat this exercise 10-15 times on each side",
      description: "Quadruped Weight Shifts "),
  StrengtheningModel(
      image: strengthening6_12_14,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "bridging"),
  StrengtheningModel(
      image: strengthening6_12_15,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "	one leg bridging / half bridging"),
  StrengtheningModel(
      image: strengthening6_12_16,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "blank "),
  StrengtheningModel(
      image: strengthening6_12_17,
      title: "",
      set: "3 sets",
      repetition: "Repetition 10 times aday/3days ",
      description: "	Inferior glide "),
  StrengtheningModel(
      image: strengthening6_12_18,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "	Scapular retraction with elastic band "),
  StrengtheningModel(
      image: strengthening6_12_19,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "	low row with elastic band"),
  StrengtheningModel(
      image: strengthening6_12_20,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "	Scapular up ward rotation with elastic band "),
  StrengtheningModel(
      image: strengthening6_12_21,
      title: "",
      set: "3 sets",
      repetition: "15 repetition and hold for 30 seconds ",
      description: "Scapular orientation  with theraband"),
];
List<StrengtheningModel> strengtheningList12_24 = [
  StrengtheningModel(
      image: "strengthening0_3_1",
      title: "Postoperative rehabilitation during the first 3 weeks(0-3)",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Strengthening forward elevation in scapular plane :90 degree"),
  StrengtheningModel(
      image: "strengthening0_3_2",
      title: "Postoperative rehabilitation during the first 3 weeks(0-3)",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Strengthening external rotation at 20 degree of abduction in scapular plane(10-30)degree"),
];
