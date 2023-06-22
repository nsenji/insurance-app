import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:insurease/auth_services/auth_service.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:provider/provider.dart';

import '../api/get_products.dart';
import '../authentication/getUser.dart';
import '../notifiers/productType.dart';
import '../notifiers/userObjectNotifier.dart';
import '../pages/app_pages/restart_widget.dart';
import '../pages/app_pages/welcome.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User?>(
      stream: authProvider.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;
          if (user != null) {
            return const Restart();
          }
          return const Welcome();
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
// look at the differences btn the streamProvider and the streamBuilder