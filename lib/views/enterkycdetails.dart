import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class EnterKYCDetails extends StatefulWidget {
  _EnterKYCDetailsState createState() => _EnterKYCDetailsState();
}

class _EnterKYCDetailsState extends State<EnterKYCDetails> {
  String? selectedGender;
  String? selectedEducation;
  String? selectedLanguage;

  final dobController = TextEditingController();
  String loanAmount = "0";
  String fee = "0";
  String interest = "0";
  late SharedPreferences mprefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      setState(() {
        mprefs = value;
        loanAmount = value.getString('loan_amount')!;
        fee = value.getString('fee')!;
        interest = value.getString('interest')!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 100,
                            animation: true,
                            lineHeight: 20.0,
                            animationDuration: 2000,
                            percent: 0.50,
                            center: Text(
                              "50% complete",
                              style: subtitle1,
                            ),
                            progressColor: primaryColor,
                          ),
                          Row(
                            children: [
                              Text(
                                "Principal:  $loanAmount KES / Interest: $interest",
                                style: subtitle2.copyWith(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    InkWell(
                       onTap: () {
                  
                  Get.toNamed('/agreement');
                },
                      child: Column(
                        children: [
                          const Icon(
                            Icons.help,
                            color: primaryColor,
                          ),
                          Text(
                            "Help",
                            style: subtitle1.copyWith(color: primaryColor),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Gender",
                style: subtitle.copyWith(color: Colors.grey, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                child: DropdownButton(
                  hint: selectedGender == null
                      ? Text(
                          '',
                          style: subtitle,
                        )
                      : Text(selectedGender!, style: subtitle1),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: subtitle1,
                  items: ['Male', 'Female', 'Transgender'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: subtitle.copyWith(color: Colors.black),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        selectedGender = val;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Date of Birth",
                style: subtitle.copyWith(color: Colors.grey, fontSize: 20),
              ),
              TextFormField(
                controller: dobController,
                onTap: () async{
                          final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960, 8),
                                lastDate: DateTime.now());
                            if (picked != null) {
                              setState(() {
                                dobController.text = getdatedate(picked);
                              });
                            }
                          
                        },
                decoration: InputDecoration(
                    hintStyle: subtitle1,
                    suffixIcon: InkWell(
                        onTap: () async{
                          final DateTime? picked = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1960, 8),
                                lastDate: DateTime.now());
                            if (picked != null) {
                              setState(() {
                                dobController.text = getdatedate(picked);
                              });
                            }
                          
                        },
                        child: const Icon(Icons.arrow_drop_down_sharp)),
                    hintText: ""),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Educational Level",
                style: subtitle.copyWith(color: Colors.grey, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                child: DropdownButton(
                  hint: selectedEducation == null
                      ? Text(
                          '',
                          style: subtitle,
                        )
                      : Text(selectedEducation!, style: subtitle1),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: subtitle1,
                  items: [
                    'Post Graduate',
                    'Under Graduate',
                    'Secondary Level',
                    'Primary School Level'
                  ].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: subtitle.copyWith(color: Colors.black),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        selectedEducation = val;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Language Preference",
                style: subtitle.copyWith(color: Colors.grey, fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(top: 0),
                child: DropdownButton(
                  hint: selectedLanguage == null
                      ? Text(
                          '',
                          style: subtitle,
                        )
                      : Text(selectedLanguage!, style: subtitle1),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: subtitle1,
                  items: ['English', 'Swahili'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(
                          val,
                          style: subtitle.copyWith(color: Colors.black),
                        ),
                      );
                    },
                  ).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        selectedLanguage = val;
                      },
                    );
                  },
                ),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                      colors: [secondaryColor, primaryColor],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomCenter),
                ),
                child: InkWell(
                  onTap: () {
                    if (selectedGender != null) {
                      if (dobController.text.isNotEmpty) {
                        if (selectedEducation != null) {
                          if (selectedLanguage != null) {
                            mprefs.setString('gender', selectedGender!);
                            mprefs.setString('education', selectedEducation!);
                            mprefs.setString('language', selectedLanguage!);
                            mprefs.setString('dob', dobController.text);
                            Get.offNamed('/nextofkin');

                          } else {
                            showToast(
                                "Select your preferred language", Colors.red);
                          }
                        } else {
                          showToast("Select education level", Colors.red);
                        }
                      } else {
                        showToast("Enter Date of Birth", Colors.red);
                      }
                    } else {
                      showToast("Select Gender", Colors.red);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Center(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "NEXT",
                            style: subtitle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
