import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

class AppCubit extends Cubit<AppStates> {
  // Firebase database reference
  final DatabaseReference _databaseReference = FirebaseDatabase.instance.ref();

  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  void createNotifaction(String title) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: 'Sensor Connectivity ',
          body: title,
          actionType: ActionType.KeepOnTop),
      // schedule: NotificationCalendar.fromDate(
      //   date: DateFormat('yyyy-MM-dd hh:mm a')
      //       .parse(DateController.text + " " + StartTimeController.text),
      // ),
    );
    // "2022-07-27 20:30:04"

    //  AwesomeNotifications().cancel(1);
    //
  }


  // Method to upload data to the database
  void uploadData(List<String> dataList) {
    // Upload 'x', 'y', and 'z' values under the 'data' collection
    _databaseReference.child('check').update({
      'connected': dataList[0],
    });
  }

  int x = 0;
  int y = 0;
  int z = 0;
  String check = "";


  // Method to get data from the database
  getCheckData() {
    _databaseReference.child('check').onValue.listen((event) {
      Map<dynamic, dynamic> values =
          Map.from(event.snapshot.value as Map<dynamic, dynamic>);
      String newcheck = values['connected'];

      check = newcheck;

      if (check == 'sensor is connected ') {
        createNotifaction(check);
      }
      if (check == 'sensor is not connected '||check == '') {
        createNotifaction('⚠ Sensor is not Connected');
      }
      emit(getCheckDataState());
    });
  }

  getXData() {
    _databaseReference.child('data').onValue.listen((event) {
      Map<dynamic, dynamic> values =
          Map.from(event.snapshot.value as Map<dynamic, dynamic>);
      int newX = values['x'];

      x = newX;
      emit(getXDataState());
    });
  }

  getYData() {
    _databaseReference.child('data').onValue.listen((event) {
      Map<dynamic, dynamic> values =
          Map.from(event.snapshot.value as Map<dynamic, dynamic>);
      int newY = values['y'];

      y = newY;
      emit(getYDataState());
    });
  }

  getZData() {
    _databaseReference.child('data').onValue.listen((event) {
      Map<dynamic, dynamic> values =
          Map.from(event.snapshot.value as Map<dynamic, dynamic>);
      int newZ = values['z'];

      z = newZ;
      emit(getZDataState());
    });
  }
}

List<String> dataList = [
  '',
];
