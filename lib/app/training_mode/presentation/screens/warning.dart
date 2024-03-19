import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/weeks.dart';
import 'package:shoulder_rehabilitation/core/utils/app_theme_colors.dart';
import 'package:shoulder_rehabilitation/core/utils/assets_images_path.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';
import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/strings.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WarningScreen extends StatefulWidget {
  const WarningScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  final int id;
  @override
  _WarningScreenState createState() => _WarningScreenState();
}

class WarningModel {
  final String image;
  final String title;
//   final String image;
//   final String title;
  final String description;

//   PageViewModel(this.image, this.title, );
  WarningModel(
      {required this.image, required this.title, required this.description});
}

class _WarningScreenState extends State<WarningScreen> {
  // void Submit() {
  //   CashHelper.SaveData(key: 'onWarning', value: true).then((value) {
  //     if (value) {
  //       print('on Warning save true');
  //       // NavAndFinish(context, HomeScreen());
  //       // NavAndFinish(context, LoginScreen());
  //       widget.isFromDrawer
  //           ? Navigator.pop(context)
  //           : NavAndFinish(context, LoginScreen());
  //     }
  //   });
  // }

  var WarningController = PageController();
  bool islast = false;
  @override
  Widget build(BuildContext context) {
    List<WarningModel> Phase1Warning = [
      WarningModel(
          image: warning1,
          title:
              "Passive external rotation at 90 degree of abduction: contraindicated ",
          description: ""),
      WarningModel(
          image: warning2,
          title: "Avoid extension in this phase",
          description: ""),
      WarningModel(
          image: warning3,
          title: "Avoid external rotation at 90 degree of abduction ",
          description: ""),
      WarningModel(
          image: warning4,
          title: "Avoid active range of motion of shoulder joint in this phase",
          description: ""),
      WarningModel(
          image: warning5,
          title: "Avoid scapular protraction  in this phase ",
          description: ""),
      WarningModel(
          image: warning6,
          title: "Avoid horizontal abduction in this phase ",
          description: ""),
      WarningModel(
          image: warning7,
          title: "Avoid push up in this phase",
          description: ""),
    ];
    List<WarningModel> Phase2Warning = [
      WarningModel(
          image: phase2warning,
          title: "Avoid heavy lefting in this phase  ",
          description: ""),
    ];

    return Scaffold(
      backgroundColor: AppColors.kwhite,
      appBar: AppBar(
        backgroundColor: AppColors.kwhite,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Icon(
                          Icons.warning_amber,
                          size: 40,
                          color: Colors.red,
                        ),
                        const Spacer(
                            // height: 20,
                            ),
                        Text(
                          "Contraindications",
                          style: TextStyles.styleblackBold18,
                          textDirection: TextDirection.rtl,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: context.height * 50 / 100,
                child: PageView.builder(
                  controller: WarningController,
                  onPageChanged: (int index) {
                    widget.id == 1 && index == Phase1Warning.length - 1
                        ? setState(() {
                            islast = true;
                          })
                        : widget.id == 2 && index == Phase1Warning.length - 1
                            ? setState(() {
                                islast = true;
                              })
                            : widget.id == 3 &&
                                    index == Phase2Warning.length - 1
                                ? setState(() {
                                    islast = true;
                                  })
                                : setState(() {
                                    islast = false;
                                  });
                  },
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => Build_Warning_Item(
                    widget.id == 1
                        ? Phase1Warning[index]
                        : widget.id == 2
                            ? Phase1Warning[index]
                            : widget.id == 3
                                ? Phase2Warning[index]
                                : Phase2Warning[index],
                  ),
                  itemCount: widget.id == 1
                      ? Phase1Warning.length
                      : widget.id == 2
                          ? Phase1Warning.length
                          : widget.id == 3
                              ? Phase2Warning.length
                              : Phase2Warning.length,
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
                controller: WarningController,
                effect: const ScrollingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  activeDotColor: Color(0xffF89368),
                  dotWidth: 10,
                ),
                count: widget.id == 1
                    ? Phase1Warning.length
                    : widget.id == 2
                        ? Phase1Warning.length
                        : widget.id == 3
                            ? Phase2Warning.length
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
                child: islast || (Phase2Warning.length == 1 && widget.id == 3)
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
                          NavTo(
                              context,
                              Weeks(
                                id: widget.id,
                              ));
                        },
                        child: AutoSizeText(
                          "Ok",
                          style: TextStyles.stylewhitebold20,
                        ),
                      )
                    : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget Build_Warning_Item(WarningModel model) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              // fit: BoxFit.contain,
              image: AssetImage(
                model.image,
              ),
              height: context.height * .3,
            ),
            SizedBox(
              height: context.height * .05,
            ),
            AutoSizeText(
              model.title,
              style: TextStyles.styleellipsisbold20,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
            const SizedBox(
              height: 7,
            ),
            AutoSizeText(
              model.description,
              style: TextStyles.styleeredllipsis18,
              textAlign: TextAlign.center,
              maxLines: 4,
            ),
          ],
        ),
      );
}
