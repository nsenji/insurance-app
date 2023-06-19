import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/authentication/updateUser.dart';
import 'package:insurease/pages/app_pages/payment.dart';
import 'package:insurease/pages/bottom_nav_pages/navBar.dart';
import 'package:insurease/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../api/createCustomer.dart';
import '../../notifiers/userObjectNotifier.dart';
import '../../tools/button.dart';
import '../../tools/major_font.dart';
import '../bottom_nav_pages/my_account_pages.dart';

class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  _CompleteProfileState() {
    _selectedVal = _genderList[0];
  }

  createCustomer() async {
    var user = Provider.of<UserNotifier>(context, listen: false).user;
    await postCustomer(
        user?.ref ?? 'placeholder',
        user?.firstname ?? 'placeholder',
        user?.lastname ?? 'placeholder',
        _phonenumber.text,
        _selectedVal ?? 'placeholder',
        _birthdate.text,
        user?.email ?? 'placeholder',
        _occupation.text,
        _residentialAddress.text,
        _natialnality.text,
        _nextOfKinName.text,
        _nextOfKinNumber.text);

    await updateUser();
  }

  final TextEditingController _phonenumber = TextEditingController();
  final TextEditingController _birthdate = TextEditingController();
  final TextEditingController _occupation = TextEditingController();
  final TextEditingController _residentialAddress = TextEditingController();
  final TextEditingController _natialnality = TextEditingController();
  final TextEditingController _nextOfKinName = TextEditingController();
  final TextEditingController _nextOfKinNumber = TextEditingController();

  String? _selectedVal = '';
  final _genderList = ["M", "F"];

  // bool phoneIsEmpty = false;
  bool birthIsEmpty = false;
  bool residenceIsEmpty = false;
  bool kinNameIsEmpty = false;
  bool kinNumberIsEmpty = false;

  shownotification() {
    Fluttertoast.showToast(
        msg: 'Fill all the fields',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    var user2 = Provider.of<UserNotifier>(context, listen: false).user;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.containerColor,
        title: MajorFont(
          text: 'Complete profile',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: user2?.profileComplete == true
          ? Center(
              child: MajorFont(
                  text: 'your profile is complete ...', weight: false),
            )
          : SingleChildScrollView(
              child: Container(
                margin:
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        // changes position of shadow
                      ),
                    ],
                    color: AppColors.containerColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                // height: 850,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _phonenumber,
                        decoration: InputDecoration(
                            // errorText: codeIsEmpty ? 'This field is required' : null,
                            label: MajorFont(
                          text: 'Phone Number',
                          weight: false,
                          size: 15,
                        )
                            //hintText: 'username',

                            ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(17.0),
                        child: DropdownButtonFormField(
                          value: _selectedVal,
                          items: _genderList
                              .map((e) =>
                                  DropdownMenuItem(child: Text(e), value: e))
                              .toList(),
                          onChanged: (val) {
                            setState(() {
                              _selectedVal = val as String;
                            });
                          },
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: AppColors.primeColor,
                          ),
                          dropdownColor: AppColors.containerColor,
                          decoration: InputDecoration(
                              label: MajorFont(
                            text: 'Gender',
                            weight: false,
                            size: 15,
                          )),
                        )),
                    Padding(
                      padding: EdgeInsets.all(17.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _birthdate,
                        decoration: InputDecoration(
                            // errorText: codeIsEmpty ? 'This field is required' : null,
                            label: MajorFont(
                          text: 'Birth Date',
                          weight: false,
                          size: 15,
                        )),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(
                                  1950), //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            // print(
                            //     pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            // print(
                            //     formattedDate); //formatted date output using intl package =>  2021-03-16
                            //you can implement different kind of Date Format here according to your requirement

                            setState(() {
                              _birthdate.text =
                                  formattedDate; //set output date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(17.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _occupation,
                        decoration: InputDecoration(
                          // errorText: codeIsEmpty ? 'This field is required' : null,
                          label: MajorFont(
                            text: 'Occupation',
                            weight: false,
                            size: 15,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _residentialAddress,
                        decoration: InputDecoration(
                            // errorText: codeIsEmpty ? 'This field is required' : null,
                            label: MajorFont(
                          text: 'Residential address',
                          weight: false,
                          size: 15,
                        )
                            //hintText: 'username',

                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _natialnality,
                        decoration: InputDecoration(
                          // errorText: codeIsEmpty ? 'This field is required' : null,
                          label: MajorFont(
                            text: 'Nationality',
                            weight: false,
                            size: 15,
                          ),
                        ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _nextOfKinName,
                        decoration: InputDecoration(
                            // errorText: codeIsEmpty ? 'This field is required' : null,
                            label: MajorFont(
                          text: 'Next of kin Name',
                          weight: false,
                          size: 15,
                        )
                            //hintText: 'username',

                            ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: TextField(
                        style: TextStyle(color: AppColors.blackColor),
                        controller: _nextOfKinNumber,
                        decoration: InputDecoration(
                            // errorText: codeIsEmpty ? 'This field is required' : null,
                            label: MajorFont(
                          text: 'Next of kin Number',
                          weight: false,
                          size: 15,
                        )
                            //hintText: 'username',

                            ),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.only(top: 20),
                        child: InkWell(
                            child: Button(text: 'Submit'),
                            onTap: () {
                              setState(() {
                                // _phonenumber.text.isEmpty
                                //     ? phoneIsEmpty = true
                                //     : phoneIsEmpty = false;

                                _birthdate.text.isEmpty
                                    ? residenceIsEmpty = true
                                    : residenceIsEmpty = false;
                                _occupation.text.isEmpty
                                    ? kinNameIsEmpty = true
                                    : kinNameIsEmpty = false;
                                _residentialAddress.text.isEmpty
                                    ? kinNumberIsEmpty = true
                                    : kinNumberIsEmpty = false;
                              });
                              bool somefalse = birthIsEmpty ||
                                  residenceIsEmpty ||
                                  kinNameIsEmpty ||
                                  kinNumberIsEmpty;

                              somefalse
                                  ? {
                                      setState(
                                        () {
                                          shownotification();
                                        },
                                      ),
                                    }
                                  : {
                                      createCustomer(),
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => NavBar()),
                                        (route) => false,
                                      )
                                    };
                            }),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}




// String ref,
//     String phoneNumber,
//     String gender,
//     String birthDate,
//     String occupation,
//     String residence,
//     String nationality,
//     String kinName,
//     String kinNumber


//  how to validate password.
// final confirmPassword = TextFormField(
//   controller: widget.confirmPasswordController,
//   obscureText: true,
//   decoration: InputDecoration(
//     prefixIcon: Icon(Icons.lock_open, color: Colors.grey),
//     hintText: 'Confirm Password',
//     errorText: validatePassword(widget.confirmPasswordController.text),
//     contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//   ),
// );

// String validatePassword(String value) {
//   if (!(value.length > 5) && value.isNotEmpty) {
//     return "Password should contain more than 5 characters";
//   }
//   return null;
// }