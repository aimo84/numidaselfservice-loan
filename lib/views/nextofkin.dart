import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/utils.dart';

class NextofKin extends StatefulWidget {
  _NextofKinState createState() => _NextofKinState();
}

class _NextofKinState extends State<NextofKin> {
  String? selectedKinone;
  final textKinoneController = TextEditingController();
  final textKintwoController = TextEditingController();
  String? selectedKintwo;

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
                            percent: 0.61,
                            center: Text(
                              "61% complete",
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
                    Column(
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
                    )
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(
                height: 50,
              ),
              Text(
                "Next of Kin",
                style: subtitle.copyWith(color: Colors.grey, fontSize: 20),
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        DropdownButton(
                          hint: selectedKinone == null
                              ? Text(
                                  '',
                                  style: subtitle,
                                )
                              : Text(selectedKinone!, style: subtitle1),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: subtitle1,
                          items: [
                            'Husband/Wife',
                            'Brother/Sister',
                            'Father',
                            'Monther',
                            'Son',
                            'Daughter',
                            'Other'
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
                                selectedKinone = val;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textKinoneController,
                      decoration: InputDecoration(
                          hintStyle: subtitle1,
                          contentPadding: EdgeInsets.all(0),
                          hintText: ""),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        DropdownButton(
                          hint: selectedKintwo == null
                              ? Text(
                                  '',
                                  style: subtitle,
                                )
                              : Text(selectedKintwo!, style: subtitle1),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: subtitle1,
                          items: [
                            'Husband/Wife',
                            'Brother/Sister',
                            'Father',
                            'Monther',
                            'Son',
                            'Daughter',
                            'Other'
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
                                selectedKintwo = val;
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: textKintwoController,
                      decoration:
                          InputDecoration(hintStyle: subtitle1, hintText: ""),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
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
                    if (selectedKinone != null &&
                        textKinoneController.text.isNotEmpty) {
                      if (selectedKintwo != null &&
                          textKintwoController.text.isNotEmpty) {
                        mprefs.setString('kinone', textKinoneController.text);
                        mprefs.setString('kintwo', textKintwoController.text);
                        Get.offNamed('/verifyidentity');
                      } else {
                        showToast("Enter next of kin", Colors.red);
                      }
                    } else {
                      showToast("Enter next of kin", Colors.red);
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
