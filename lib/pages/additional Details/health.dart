import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:insurease/api/buyPlan.dart';
import 'package:insurease/notifiers/productType.dart';
import 'package:insurease/notifiers/userObjectNotifier.dart';
import 'package:insurease/pages/app_pages/payment.dart';
import 'package:insurease/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../tools/button.dart';
import '../../tools/major_font.dart';

class Health extends StatefulWidget {
  String code;
  Health({super.key, required this.code});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final TextEditingController _policyStartDate = TextEditingController();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _medicalHistory = TextEditingController();
  final TextEditingController _nextofkinName = TextEditingController();
  final TextEditingController _nextofkinEmail = TextEditingController();
  final TextEditingController _nextofkinPhone = TextEditingController();

  bool codeIsEmpty = false;
  bool refIsEmpty = false;
  bool payIsEmpty = false;
  bool dateIsEmpty = false;
  bool locationIsEmpty = false;
  bool historyIsEmpty = false;
  bool kinIsEmpty = false;

  shownotification1(String message) {
    Fluttertoast.showToast(
        backgroundColor: AppColors.primeColor,
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  shownotification2(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 4);
  }

  getHealth() async {
    String answer = await buyhealth(
        widget.code,
        Provider.of<UserNotifier>(context, listen: false).user!.ref,
        _policyStartDate.text,
        _location.text,
        _medicalHistory.text,
        _nextofkinName.text,
        _nextofkinEmail.text,
        _nextofkinPhone.text);

    shownotification2(answer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.containerColor,
        title: MajorFont(
          text: 'Additional details',
          color: AppColors.blackColor,
          weight: false,
        ),
        leading: IconButton(
            color: AppColors.blackColor,
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 30),
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
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _policyStartDate,
                      decoration: InputDecoration(
                        // errorText: codeIsEmpty ? 'This field is required' : null,
                        label: MajorFont(
                          text: 'Policy Start Date',
                          weight: false,
                          size: 15,
                        ),
                      ),
                      readOnly: true,
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2020), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          //you can implement different kind of Date Format here according to your requirement

                          setState(() {
                            _policyStartDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {
                          print("Date is not selected");
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _location,
                      decoration: InputDecoration(
                          // errorText: codeIsEmpty ? 'This field is required' : null,
                          label: MajorFont(
                        text: 'Preferred hospital location',
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
                      controller: _medicalHistory,
                      decoration: InputDecoration(
                        // errorText: codeIsEmpty ? 'This field is required' : null,
                        label: MajorFont(
                          text: 'Medical History',
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
                      controller: _nextofkinName,
                      decoration: InputDecoration(
                        // errorText: codeIsEmpty ? 'This field is required' : null,
                        label: MajorFont(
                          text: 'Next of kin name',
                          weight: false,
                          size: 15,
                        ),
                      ),
                      keyboardType: TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _nextofkinEmail,
                      decoration: InputDecoration(
                          // errorText: codeIsEmpty ? 'This field is required' : null,
                          label: MajorFont(
                        text: 'Next Of Kin Email',
                        weight: false,
                        size: 15,
                      )
                          //hintText: 'Email',

                          ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(17.0),
                    child: TextField(
                      style: TextStyle(color: AppColors.blackColor),
                      controller: _nextofkinPhone,
                      decoration: InputDecoration(
                          // errorText: codeIsEmpty ? 'This field is required' : null,
                          label: MajorFont(
                        text: 'Next Of Kin Phone',
                        weight: false,
                        size: 15,
                      )
                          //hintText: 'Email',

                          ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(top: 20),
                      child: InkWell(
                          child: Button(text: 'Submit'),
                          onTap: () {
                            setState(() {
                              _policyStartDate.text.isEmpty
                                  ? dateIsEmpty = true
                                  : dateIsEmpty = false;
                              _location.text.isEmpty
                                  ? locationIsEmpty = true
                                  : locationIsEmpty = false;
                              _medicalHistory.text.isEmpty
                                  ? historyIsEmpty = true
                                  : historyIsEmpty = false;
                              _nextofkinName.text.isEmpty
                                  ? kinIsEmpty = true
                                  : kinIsEmpty = false;
                            });
                            bool somefalse = codeIsEmpty ||
                                refIsEmpty ||
                                payIsEmpty ||
                                dateIsEmpty ||
                                locationIsEmpty ||
                                historyIsEmpty ||
                                kinIsEmpty;

                            somefalse
                                ? {
                                    setState(
                                      () {
                                        shownotification1(
                                            'Fill all the fields');
                                      },
                                    ),
                                  }
                                : {
                                    setState(
                                      () {
                                        getHealth();
                                      },
                                    )
                                  };
                          }),
                    ),
                  )
                  ,
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}






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