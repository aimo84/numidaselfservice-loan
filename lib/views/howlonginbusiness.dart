import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class HowLongInBusiness extends StatefulWidget {
  _HowLongInBusinessState createState() => _HowLongInBusinessState();
}

class _HowLongInBusinessState extends State<HowLongInBusiness> {
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
                        percent: 0.30,
                        center: Text(
                          "34% complete",
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
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RichText(
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Select Employment',
                    style: subtitle.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Colors.grey
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Type? ",
                        style: titleText4.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButton(
                  hint: _dropDownValue == null
                      ? Text('', style: subtitle,)
                      : Text(
                          _dropDownValue!,
                          style: subtitle1
                        ),
                  isExpanded: true,
                  iconSize: 30.0,
                  style: subtitle1,
                  items: ['Self Employed', 'Employed'].map(
                    (val) {
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val, style: subtitle.copyWith(color: Colors.black),),
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
                            value.setString('employtype', _dropDownValue!);
                            Get.offNamed('/salesmade');
                          });
                        } else {
                          showToast(
                              "Please select employment type", Colors.red);
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
