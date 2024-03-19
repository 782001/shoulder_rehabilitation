

import 'package:ping_discover_network_plus/ping_discover_network_plus.dart';


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class SensorDataPage extends StatefulWidget {
  @override
  _SensorDataPageState createState() => _SensorDataPageState();
}

class _SensorDataPageState extends State<SensorDataPage> {
  final DatabaseReference _sensorDataRef =
      FirebaseDatabase.instance.ref().child('sensorData');

  @override
  void initState() {
    super.initState();
    sendDataToFirebaseIfConnected();
  }

  Future<void> sendDataToFirebaseIfConnected() async {
    // Check if the device is connected to the internet
    var connectivityResult = await (Connectivity().checkConnectivity());
    bool isConnected = connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;

    if (isConnected) {
      // Ping the sensor's IP address or domain to check if it's reachable
      // Replace 'sensorIPAddress' with the actual IP address of the sensor
      bool isSensorConnected = await pingSensor('sensorIPAddress');

      if (isSensorConnected) {
        // Sensor is connected, send data to Firebase
        _sensorDataRef.push().set({
          'value': 'sensorValue',
          'timestamp': DateTime.now().toString(),
        });
      } else {
        // Sensor is not connected, show dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Sensor Not Connected'),
              content: Text(
                  'Please make sure the sensor is connected to the network.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  Future<bool> pingSensor(String ipAddress) async {
    // Ping the sensor's IP address or domain
    // You can use the ping_discover_network package to ping the sensor
    // Example:
    // final Ping ping = Ping(ip: ipAddress);
    // PingResult result = await ping.ping(timeout: Duration(seconds: 2));
    // return result.success;
    return true; // Placeholder, replace with actual ping logic
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sensor Data'),
      ),
      body: Center(
        child: Text('Sensor Data Page'),
      ),
    );
  }
}
