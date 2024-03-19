import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/finish_week_screen.dart';
import 'package:shoulder_rehabilitation/core/utils/app_theme_colors.dart';
import 'package:shoulder_rehabilitation/core/utils/assets_images_path.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PolymetricScreen extends StatefulWidget {
  const PolymetricScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  _PolymetricScreenState createState() => _PolymetricScreenState();
}

class PolymetricModel {
  final String image;
  final String title;
//   final String image;
//   final String title;
  final String set;
  final String description;
  final String repetition;

//   PageViewModel(this.image, this.title, );
  PolymetricModel(
      {required this.image,
      required this.title,
      required this.set,
      required this.description,
      required this.repetition});
}

class _PolymetricScreenState extends State<PolymetricScreen> {
  // void Submit() {
  //   CashHelper.SaveData(key: 'onPolymetric', value: true).then((value) {
  //     if (value) {
  //       print('on Polymetric save true');
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
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        seconds++;
        if (seconds == 15 || (seconds == 10 && widget.id == 3)) {
          timer.cancel(); // Stop the timer when it reaches 15 seconds
          numberOfRepetitions++; // Increment the number of repetitions
          int repetitionsFromModel = 0;
          // Check if the model.set contains a number
          if (widget.id == 3) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                PolymetricList12_24[PolymetricController.page!.round()]
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

  int currentIndex = 0;
  var PolymetricController = PageController();
  bool islast = false;
  void onPageChanged(int newIndex) {
    setState(() {
      if (newIndex > currentIndex) {
        // Reset the timer only when scrolling to the next index
        seconds = 0;
        numberOfRepetitions = 0;
      }
      currentIndex = newIndex;
    });

    // Only start a new timer if there is no Polymetric timer
    if (!timer.isActive) {
      startTimer();
    }
  }

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

              SizedBox(
                height: context.height * 55 / 100,
                child: PageView.builder(
                    controller: PolymetricController,
                    onPageChanged: (int index) {
                      onPageChanged(index);

                      index == PolymetricList12_24.length - 1
                          ? setState(() {
                              islast = true;
                            })
                          : setState(() {
                              islast = false;
                            });

                      // if (widget.id == 1 && index == activList0_3.length - 1) {
                      //   setState(() {
                      //     islast = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     islast = false;
                      //   });
                      // }
                      // if (widget.id == 2 && index == activList3_6.length - 1) {
                      //   setState(() {
                      //     islast = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     islast = false;
                      //   });
                      // }
                      // if (widget.id == 3 && index == activList6_12.length - 1) {
                      //   setState(() {
                      //     islast = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     islast = false;
                      //   });
                      // }
                      // if (widget.id == 4 && index == activList12_24.length - 1) {
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
                    itemBuilder: (context, index) => Build_Polymetric_Item(
                          PolymetricList12_24[index],
                        ),
                    itemCount: PolymetricList12_24.length),
              ),
              // SizedBox(
              //   height: context.height * .05,
              // ),
              // const Spacer(),
              // SizedBox(
              //   height: context.height * .1,
              // ),
              SmoothPageIndicator(
                controller: PolymetricController,
                effect: const ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  activeDotColor: Color(0xffF89368),
                  dotWidth: 10,
                ),
                count: PolymetricList12_24.length,
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
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2)),
                            ),
                          ),
                          onPressed: () {
                            NavTo(
                                context,
                                FinishWeekScreen(
                                  id: widget.id,
                                ));
                            setState(() {
                              islast = false;
                            });
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
                            elevation:
                                MaterialStateProperty.resolveWith<double>(
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
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                  side: const BorderSide(
                                      color: Colors.blue, width: 2)),
                            ),
                          ),
                          onPressed: () {
                            PolymetricController.nextPage(
                                duration: const Duration(
                                  milliseconds: 750,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: AutoSizeText(
                            "Next",
                            style: TextStyles.stylewhitebold20,
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }

  Widget Build_Polymetric_Item(PolymetricModel model) => SingleChildScrollView(
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
            Row(
              children: [
                AutoSizeText(
                  model.set,
                  style: TextStyles.styleellipsis18,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                ),
                Spacer()
              ],
            ),
            Row(
              children: [
                AutoSizeText(
                  model.repetition,
                  style: TextStyles.styleellipsis18,
                  textAlign: TextAlign.start,
                  maxLines: 4,
                ),
                Spacer(),
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
                SizedBox(
                  width: 10,
                )
              ],
            ),
          ],
        ),
      );
}

List<PolymetricModel> PolymetricList12_24 = [
  PolymetricModel(
      image: polymetric6_12_1,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Wobble board shoulder stability"),
  PolymetricModel(
      image: polymetric6_12_2,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "strength Shoulder internal rotation "),
  PolymetricModel(
      image: polymetric6_12_3,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Strength Shoulder external rotation "),
  PolymetricModel(
      image: polymetric6_12_4,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Overhead ball throw  "),
  PolymetricModel(
      image: polymetric6_12_5,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "ball ear throw "),
  PolymetricModel(
      image: polymetric6_12_6,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "ball chest pass "),
  PolymetricModel(
      image: polymetric6_12_7,
      title: "",
      set: "3 set ",
      repetition: " 15 repetitions each side ",
      description: "Side plank with shoulder external rotation"),
  PolymetricModel(
      image: polymetric6_12_8,
      title: "",
      set: "3 set ",
      repetition: " 15 repetitions each side ",
      description: "Three point plank with diagonal arm raises"),
  PolymetricModel(
      image: polymetric6_12_9,
      title: "",
      set: "3 set ",
      repetition: " 15 repetitions each side ",
      description: "Three point plank with shoulder extension"),
  PolymetricModel(
      image: polymetric6_12_10,
      title: "",
      set: "3 set ",
      repetition: " 15 repetitions each side ",
      description: "Three point plank with shoulder row"),
  PolymetricModel(
      image: polymetric6_12_11,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Rotator cuff polymetric exercise ( shoulder sticks ) "),
  PolymetricModel(
      image: polymetric6_12_12,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Squat to thrust "),
  PolymetricModel(
      image: polymetric6_12_13,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Diagnol ball wood chop "),
  PolymetricModel(
      image: polymetric6_12_14,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Closed stance ball throw "),
  PolymetricModel(
      image: polymetric6_12_15,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Active shoulder abduction "),
  PolymetricModel(
      image: polymetric6_12_16,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Codman exercise"),
  PolymetricModel(
      image: polymetric6_12_17,
      title: "",
      set: "3 set ",
      repetition: "15 repetition",
      description: "Resisted shoulder elevation "),
];
