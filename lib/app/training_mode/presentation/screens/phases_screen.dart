import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/warning.dart';
import 'package:shoulder_rehabilitation/app/training_mode/presentation/screens/weeks.dart';
import 'package:shoulder_rehabilitation/core/utils/components.dart';

import 'package:shoulder_rehabilitation/core/utils/media_query_values.dart';
import 'package:shoulder_rehabilitation/core/utils/styles.dart';

class phases_screen extends StatelessWidget {
  phases_screen({super.key});

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
                      AutoSizeText("Phase 1", style: TextStyles.styleblack20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    NavTo(
                                      context,
                                      WarningScreen(id: 1),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.calendar_view_day_outlined),
                                      AutoSizeText(
                                        '0-3  Weeks',
                                        style: TextStyles.styleblackBold15,
                                      ),
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    NavTo(
                                      context,
                                      WarningScreen(id: 2),
                                    );
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.next_week_outlined),
                                      AutoSizeText(
                                        '3-6  Weeks',
                                        style: TextStyles.styleblackBold15,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      AutoSizeText("Phase 2", style: TextStyles.styleblack20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  NavTo(
                                    context,
                                    WarningScreen(id: 3),
                                  );
                                },
                                child: const Row(
                                  children: [
                                    Icon(Icons.calendar_view_day_outlined),
                                    AutoSizeText(
                                      '6-12  Weeks',
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
                      AutoSizeText("Phase 3", style: TextStyles.styleblack20),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                  onPressed: () {
                                    NavTo(
                                      context,
                                      Weeks(id: 4),
                                    );
                                  },
                                  child: const Row(
                                    children: [
                                      Icon(Icons.calendar_view_day_outlined),
                                      AutoSizeText(
                                        '12-24  Weeks',
                                        style: TextStyles.styleblackBold15,
                                      ),
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
