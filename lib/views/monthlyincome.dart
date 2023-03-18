import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class MonthlyIncome extends StatefulWidget {
  _TypeOfBusinessState createState() => _TypeOfBusinessState();
}

class _TypeOfBusinessState extends State<MonthlyIncome> {
  String selected = "";
  String? _dropDownValue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 100,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.12,
                        center: Text(
                          "12% complete",
                          style: subtitle1,
                        ),
                        progressColor: primaryColor,
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
                height: 50,
              ),
              RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'What',
                  style: subtitle.copyWith(
                      fontWeight: FontWeight.w300, color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: " is your  ",
                      style: titleText4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'monthly income?',
                      style: subtitle.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  hint: _dropDownValue == null
                      ? Text(
                          '',
                          style: subtitle,
                        )
                      : Text(_dropDownValue!, style: subtitle1),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: subtitle1,
                  items: [
                    '0 - 10,000',
                    '10,000 - 30,000',
                    '30,000 - 50,000',
                    '50,000 - 100,000',
                    "100,000 - 500,000",
                    "Above 500,000"
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
                        _dropDownValue = val;
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
                    if (_dropDownValue != null) {
                      SharedPreferences.getInstance().then((value) {
                        value.setString('income', _dropDownValue!);
                        Get.toNamed('/havenationalid');
                      });
                    } else {
                      showToast("Select your monthly income", Colors.red);
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
