import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class SalesLastWeek extends StatefulWidget {
  _SalesLastWeekState createState() => _SalesLastWeekState();
}

class _SalesLastWeekState extends State<SalesLastWeek> {
  String selected = "";
  final rentController = TextEditingController();
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
                        percent: 0.35,
                        center: Text(
                          "40% complete",
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
              RichText(
                maxLines: 2,
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'How much ',
                  style: subtitle.copyWith(
                      fontWeight: FontWeight.w300, color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: " is your ",
                      style: titleText4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'House',
                      style: subtitle.copyWith(
                          fontWeight: FontWeight.w300, color: Colors.grey),
                    ),
                    TextSpan(
                      text: " Rent? ",
                      style: titleText4.copyWith(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    Container(
                      width: getWidth(context),
                      decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            "RENT",
                            style: titleText3.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: rentController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintStyle: titleText3,
                              hintText: '',
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(20),
                            ),
                          ),
                        ),
                        Text(
                          "KES",
                          style: titleText4.copyWith(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ],
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
                    if (rentController.text.isNotEmpty) {
                      SharedPreferences.getInstance().then((value) {
                            value.setString('houserent', rentController.text);
                            Get.offNamed('/weekbefore');
                          });
                    } else {
                      showToast("Enter your house Rent", Colors.red);
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
