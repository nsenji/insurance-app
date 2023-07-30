import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:insurease/Phone_auth/api_phone/location_provider.dart';
import 'package:insurease/Phone_auth/page_phone_login.dart';
import 'package:provider/provider.dart';

import '../../styles/colors.dart';
import '../../tools/major_font.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  void _dialogCallback() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.containerColor,
            iconColor: Colors.red,
            icon: const Icon(
              Icons.warning,
              size: 39,
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: MajorFont(
                text: 'Enable Location on the device',
                weight: false,
                size: 20.5,
                color: AppColors.blackColor,
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primeColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    _determinePosition();
                  },
                  child: MajorFont(
                    text: 'Accept',
                    weight: false,
                    size: 18,
                    color: AppColors.whiteColor,
                  ))
            ],
          );
        });
  }

  void _dialogCallback2() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: AppColors.containerColor,
            iconColor: Colors.red,
            icon: const Icon(
              Icons.warning,
              size: 39,
            ),
            content: Padding(
              padding: const EdgeInsets.only(left: 14),
              child: MajorFont(
                text: 'Give app permission to access the location',
                weight: false,
                size: 20.5,
                color: AppColors.blackColor,
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primeColor,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                                        _determinePosition();

                  },
                  child: MajorFont(
                    text: 'Accept',
                    weight: false,
                    size: 18,
                    color: AppColors.whiteColor,
                  ))
            ],
          );
        });
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    try {
      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _dialogCallback();

        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        // return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        setState(() {});
        if (permission == LocationPermission.denied) {
          _dialogCallback2();
          print('ok you need to provide permission for the location');
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return;
          //Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('ok you need to provide permission for the location');
        _dialogCallback2();

        // Permissions are denied forever, handle appropriately.
        // return Future.error('Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      var trueLocation = await Geolocator.getCurrentPosition();
      Provider.of<LocationProvider>(context, listen: false)
          .updatePosition(trueLocation);

      setState(() {});
      print(
          "${trueLocation} wooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooork");
      // return trueLocation;
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider.of<LocationProvider>(context, listen: false).isEmpty
          ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(mainAxisSize: MainAxisSize.min, children: [
                CircularProgressIndicator(
                  backgroundColor: AppColors.greyColor,
                  color: AppColors.primeColor,
                )
                  ]),
                  SizedBox(height:20),
                  Text('Getting current location')
              ],
            ),
          )
          : PhoneLoginPage(),
    );
  }
}
