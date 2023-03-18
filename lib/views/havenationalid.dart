import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class HaveNationalId extends StatefulWidget {
  _HaveNationalIdState createState() => _HaveNationalIdState();
}

class _HaveNationalIdState extends State<HaveNationalId> {
  String selected = "";
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
                        percent: 0.19,
                        center: Text(
                          "19% complete",
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
              const Spacer(),
              RichText(
                maxLines: 2,
                text: TextSpan(
                  text: 'Do you have a ',
                  style: subtitle.copyWith(
                      fontWeight: FontWeight.w300, color: Colors.grey),
                  children: <TextSpan>[
                    TextSpan(
                      text: " National ID? ",
                      style: titleText4.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "yes";
                      });
                    },
                    child: Text(
                      "Yes",
                      style: subtitle1.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selected = "yes";
                        });
                      },
                      child: selected == "yes"
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank)),
                  const SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = "no";
                      });
                    },
                    child: Text(
                      "No",
                      style: subtitle1.copyWith(),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          selected = "no";
                        });
                      },
                      child: selected == "no"
                          ? const Icon(Icons.check_box)
                          : const Icon(Icons.check_box_outline_blank)),
                ],
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
                    if (selected != "") {
                      SharedPreferences.getInstance().then((value) {
                        value.setString('nationalid', 'yes');
                          Get.offNamed('/mobilemoney');
                      });
                    } else {
                      showToast(
                          "Confirm that you have a national ID", Colors.red);
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
