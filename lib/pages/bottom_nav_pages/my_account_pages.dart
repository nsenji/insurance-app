import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:insurease/Firebase_paths/user_by_ID.dart';
import 'package:insurease/Image_Picker/image_picker.dart';
import 'package:insurease/authentication/getUser.dart';
import 'package:insurease/authentication/updateProfile.dart';
import 'package:insurease/pages/app_pages/app_settings.dart';
import 'package:insurease/pages/app_pages/completeProfile.dart';
import 'package:insurease/pages/app_pages/editProfile.dart';
import 'package:insurease/pages/app_pages/welcome.dart';
import 'package:insurease/tools/button.dart';
import 'package:provider/provider.dart';

import '../../Image_Picker/avatar.dart';
import '../../Image_Picker/firebase_storage.dart';
import '../../Image_Picker/firestore_service.dart';
import '../../authentication/signout.dart';
import '../../notifiers/userObjectNotifier.dart';
import '../../styles/colors.dart';
import '../../tools/major_font.dart';
import '../app_pages/notifications.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<void> _chooseAvatar(BuildContext context) async {
    final imageService =
        Provider.of<ImagePickerService>(context, listen: false);
    final user = FirebaseAuth.instance.currentUser;
    UserByID userByID = Provider.of<UserByID>(context, listen: false);
    try {
      final file = await imageService.pickImages();
      final downloadUrl = await uploadAvatar(file, user!.uid);
      await updatePicture(downloadUrl, userByID);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    UserByID userByID = Provider.of<UserByID>(context, listen: false);
    getUser(userNotifier, userByID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: true);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.containerColor,
        title: MajorFont(
          text: 'My account',
          color: AppColors.blackColor,
          weight: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: picture(),
                        builder: (context, snapshot) {
                          final avatar =
                              snapshot.data?.docs[0]['profilePicture'];
                          return Avatar(
                            photoUrl: '$avatar',
                            radius: 45,
                            borderWidth: 2.0,
                            borderColor: AppColors.primeColor,
                            onPressed: () => _chooseAvatar(context),
                          );
                        }),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(top: 14),
                      height: 30,
                      width: 300,
                      child: MajorFont(
                        text:
                            '${userNotifier.user.firstname} ${userNotifier.user.lastname}',
                        size: 20,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 30,
                      width: 300,
                      child: MajorFont(
                        text: userNotifier.user.email,
                        weight: false,
                        size: 20,
                        color: AppColors.blackColor,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 80,
                      alignment: Alignment.center,
                      child: InkWell(
                          onTap: () async {
                            await signOut();
                            // After signing out, navigate to the login page and clear the route stack
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Welcome()),
                              (route) => false,
                            );
                          },
                          child: Button(text: 'Logout')),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: SizedBox(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CompleteProfile())),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.containerColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16)),
                              border: Border.all(color: AppColors.greyColor),
                            ),
                            height: 65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MajorFont(
                                    text: 'Complete Profile',
                                    weight: false,
                                    size: 20,
                                    color: AppColors.blackColor,
                                  ),
                                  const Icon(
                                      color: AppColors.primeColor,
                                      Icons.arrow_forward_sharp)
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile())),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.containerColor,
                              border: Border(
                                  right: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  left: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  bottom: BorderSide(
                                    color: AppColors.greyColor,
                                  )),
                            ),
                            height: 65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MajorFont(
                                    text: 'Edit Profile',
                                    weight: false,
                                    size: 20,
                                    color: AppColors.blackColor,
                                  ),
                                  const Icon(
                                      color: AppColors.primeColor,
                                      Icons.arrow_forward_sharp)
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Notifications())),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.containerColor,
                              border: Border(
                                  right: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  left: BorderSide(
                                    color: AppColors.greyColor,
                                  )),
                            ),
                            height: 65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MajorFont(
                                    text: 'Notifications',
                                    weight: false,
                                    size: 20,
                                    color: AppColors.blackColor,
                                  ),
                                  const Icon(
                                      color: AppColors.primeColor,
                                      Icons.arrow_forward_sharp)
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AppSettings())),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.containerColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                  bottomRight: Radius.circular(16)),
                              border: Border(
                                  bottom: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  right: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  left: BorderSide(
                                    color: AppColors.greyColor,
                                  ),
                                  top: BorderSide(
                                    color: AppColors.greyColor,
                                  )),
                            ),
                            height: 65,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MajorFont(
                                    text: 'App Settings',
                                    weight: false,
                                    size: 20,
                                    color: AppColors.blackColor,
                                  ),
                                  const Icon(
                                      color: AppColors.primeColor,
                                      Icons.arrow_forward_sharp)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
