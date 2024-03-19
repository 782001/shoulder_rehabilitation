import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shoulder_rehabilitation/app/presentation/screens/home_screen.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/active_assisted.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/strengthening.dart';
import 'package:shoulder_rehabilitation/core/utils/app_theme_colors.dart';
import 'package:shoulder_rehabilitation/core/utils/assets_images_path.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ActiveAssistedScreen extends StatefulWidget {
  const ActiveAssistedScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  _ActiveAssistedScreenState createState() => _ActiveAssistedScreenState();
}

class ActiveAssistedModel {
  final String image;
  final String title;
//   final String image;
//   final String title;
  final String set;
  final String description;
  final String repetition;

//   PageViewModel(this.image, this.title, );
  ActiveAssistedModel(
      {required this.image,
      required this.title,
      required this.set,
      required this.description,
      required this.repetition});
}

class _ActiveAssistedScreenState extends State<ActiveAssistedScreen> {
  // void Submit() {
  //   CashHelper.SaveData(key: 'onActiveAssisted', value: true).then((value) {
  //     if (value) {
  //       print('on ActiveAssisted save true');
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
          if (widget.id == 1) {
            try {
              // Parse the set string into an integer
              repetitionsFromModel = int.parse(
                ActiveAssistedList0_3[ActiveAssistedController.page!.round()]
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
                ActiveAssistedList3_6[ActiveAssistedController.page!.round()]
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
                ActiveAssistedList6_12[ActiveAssistedController.page!.round()]
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
                ActiveAssistedList12_24[ActiveAssistedController.page!.round()]
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

  var ActiveAssistedController = PageController();
  bool islast = false;
  bool isIndex = false;
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
                  controller: ActiveAssistedController,
                  onPageChanged: (int index) {
                    onPageChanged(index);
                    widget.id == 1 && index == ActiveAssistedList0_3.length - 1
                        ? setState(() {
                            islast = true;
                          })
                        : widget.id == 2 &&
                                index == ActiveAssistedList3_6.length - 1
                            ? setState(() {
                                islast = true;
                              })
                            : widget.id == 3 &&
                                    index == ActiveAssistedList6_12.length - 1
                                ? setState(() {
                                    islast = true;
                                  })
                                : widget.id == 4 &&
                                        index ==
                                            ActiveAssistedList12_24.length - 1
                                    ? setState(() {
                                        islast = true;
                                      })
                                    : setState(() {
                                        islast = false;
                                      });
                    //
                    widget.id == 1 && (index == 2 || index == 5)
                        ? setState(() {
                            isIndex = true;
                          })
                        : widget.id == 3 &&
                                (index == 3 ||
                                    index == 4 ||
                                    index == 5 ||
                                    index == 6 ||
                                    index == 7 ||
                                    index == 5)
                            ? setState(() {
                                isIndex = true;
                              })
                            : setState(() {
                                isIndex = false;
                              });

                    // if (index == ActiveAssistedList0_3.length - 1 ||
                    //     index == ActiveAssistedList3_6.length - 1 ||
                    //     index == ActiveAssistedList6_12.length - 1 ||
                    //     index == ActiveAssistedList12_24.length - 1) {
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
                  itemBuilder: (context, index) => Build_ActiveAssisted_Item(
                    widget.id == 1
                        ? ActiveAssistedList0_3[index]
                        : widget.id == 2
                            ? ActiveAssistedList3_6[index]
                            : widget.id == 3
                                ? ActiveAssistedList6_12[index]
                                : widget.id == 4
                                    ? ActiveAssistedList12_24[index]
                                    : ActiveAssistedList12_24[index],
                  ),
                  itemCount: widget.id == 1
                      ? ActiveAssistedList0_3.length
                      : widget.id == 2
                          ? ActiveAssistedList3_6.length
                          : widget.id == 3
                              ? ActiveAssistedList6_12.length
                              : widget.id == 4
                                  ? ActiveAssistedList12_24.length
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
                controller: ActiveAssistedController,
                effect: const ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  activeDotColor: Color(0xffF89368),
                  dotWidth: 10,
                ),
                count: widget.id == 1
                    ? ActiveAssistedList0_3.length
                    : widget.id == 2
                        ? ActiveAssistedList3_6.length
                        : widget.id == 3
                            ? ActiveAssistedList6_12.length
                            : widget.id == 4
                                ? ActiveAssistedList12_24.length
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
                                StrengtheningScreen(
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
                            ActiveAssistedController.nextPage(
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

              isIndex ? SizedBox.shrink() : DisplayDataMethode(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget Build_ActiveAssisted_Item(ActiveAssistedModel model) =>
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

List<ActiveAssistedModel> ActiveAssistedList0_3 = [
  ActiveAssistedModel(
      image: activeAssets0_3_1,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Active assisted forward elevation in scapular plane :90degree "),
  ActiveAssistedModel(
      image: activeAssets0_3_2,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Active assisted external rotation at 20 degree of abduction(10-30) degree"),
  ActiveAssistedModel(
      image: activeAssets0_3_3,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description: "Unweighted pendulum exercise:  "),
  ActiveAssistedModel(
      image: activeAssets0_3_4,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description: "Forward elevation from supine 90 degree:"),
  ActiveAssistedModel(
      image: activeAssets0_3_5,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description: "Wand assisted elevation : 90 degree"),
  ActiveAssistedModel(
      image: activeAssets0_3_6,
      title: "",
      set: "",
      repetition: "",
      description: "Table step back exercise "),
];
List<ActiveAssistedModel> ActiveAssistedList3_6 = [
  ActiveAssistedModel(
      image: activeAssets3_6_1,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Active assisted forward elevation in scapular plane 135 degree  "),
  ActiveAssistedModel(
      image: activeAssets3_6_2,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Active assisted external rotation at 20 degree abduction 35_50 degree "),
  ActiveAssistedModel(
      image: activeAssets3_6_3,
      title: "",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "Active assisted external rotation at 90 abduction 45 degree "),
];
List<ActiveAssistedModel> ActiveAssistedList6_12 = [
  ActiveAssistedModel(
      image: activeAssets6_9_1,
      title: "Active assisted during the  3 weeks(6-9)",
      set: "3 times a day ",
      repetition: "10 repetition ",
      description:
          "Active assisted shoulder elevation in scapular plane : 155 degree"),
  ActiveAssistedModel(
      image: activeAssets6_9_2,
      title: "Active assisted during the  3 weeks(6-9)",
      set: "3 set",
      repetition: "10 repetition ",
      description: "Active assisted shoulder external rotation :50-65 degree"),
  ActiveAssistedModel(
      image: activeAssets9_12_1,
      title: "Active assisted during the  3 weeks(9-12)",
      set: "3 set",
      repetition: "10repetition / 3 times a day",
      description: "Active assisted shoulder elevation :155-170 degree "),
  ActiveAssistedModel(
      image: activeAssets9_12_2,
      title: "Active assisted during the  3 weeks(9-12)",
      set: "3 set",
      repetition: "10repetition / 3 times a day",
      description: "Active assisted shoulder external rotation :50-65 degree"),
];
List<ActiveAssistedModel> ActiveAssistedList12_24 = [
  ActiveAssistedModel(
      image: "ActiveAssisted0_3_1",
      title: "Postoperative rehabilitation during the first 3 weeks(0-3)",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "ActiveAssisted forward elevation in scapular plane :90 degree"),
  ActiveAssistedModel(
      image: "ActiveAssisted0_3_2",
      title: "Postoperative rehabilitation during the first 3 weeks(0-3)",
      set: "3 times per day ",
      repetition: "15 repetition ",
      description:
          "ActiveAssisted external rotation at 20 degree of abduction in scapular plane(10-30)degree"),
];
