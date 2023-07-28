// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:insurease/Firebase_paths/user_by_ID.dart';
import 'package:insurease/Image_Picker/image_picker.dart';
import 'package:insurease/Phone_auth/OTP_provider.dart';
import 'package:insurease/Phone_auth/api_phone/location.dart';
import 'package:insurease/Phone_auth/api_phone/location_provider.dart';
import 'package:insurease/auth_services/auth_service.dart';
import 'package:insurease/auth_services/auth_widget.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:provider/provider.dart';
import 'Phone_auth/OTP_input_auto.dart';
import 'Phone_auth/page_phone_login.dart';
import 'firebase_options.dart';
import 'notifiers/allPlansNotifier.dart';
import 'notifiers/userObjectNotifier.dart';
import '../pages/app_pages/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ProductTypeNotifier()),
      ChangeNotifierProvider(create: (context) => AllPlansNotifier()),
      ChangeNotifierProvider(create: (context) => UserNotifier()),
      ChangeNotifierProvider(create: (context) => FirebaseAuthService()),
      ChangeNotifierProvider(create: (context) => UserByID()),
      ChangeNotifierProvider(create: (context) => ImagePickerService()),
      ChangeNotifierProvider(create: (context) => OTPNotifier()),
      ChangeNotifierProvider(create: (context) => LocationProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'InsurEase',
        debugShowCheckedModeBanner: false,
        home: Location());
  }
}




// [to build an apk for the different mobile architectures]
// flutter build apk --split-per-abi

// before updating the flutter version make sure you can see the version that were used in that
// current project and note them down so that you can easily revert to them once you want to work 
// on that particular project again

// [to run this project in the future when you have an updated flutter and dart version]
// run flutter downrgade
// then run flutter --version   then the dart version will also dowgrade accordingly
// 






// running on both chrome and mobile


//First load on the phone and then run the command below

// flutter run -d chrome

// the hot reload of phone is the one on screen and that of the web app is the terminal where you run this command flutter run -d chrome
// to hot reload press r on the terminal and for help press h and to quit press q