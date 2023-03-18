import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomePage extends StatefulWidget {
  _WelcomePageState createState() => _WelcomePageState();
}

//
class _WelcomePageState extends State<WelcomePage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 100,
              width: 120,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/logowhite.png"))),
            ),
            Text(
              "NUMIDA",
              style: titleText.copyWith(color: Colors.white),
            ),
            Text(
              "Self Service",
              style: subtitle3.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            // Text(
            //   "BUSINESS",
            //   style: subtitle.copyWith(color: secondaryColor),
            // ),
            // const SizedBox(
            //   height: 10,
            // ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(

            //     decoration: BoxDecoration(
            //     color: secondaryColor,
            //           borderRadius: BorderRadius.circular(10),
            //   ),
            //     child: TextFormField(

            //       controller: phonenumberController,
            //       keyboardType: TextInputType.number,
            //       decoration: InputDecoration(
            //         contentPadding: const EdgeInsets.all(8),
            //         focusedBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(10),
            //           borderSide:
            //               BorderSide(color: Colors.black.withOpacity(0.12)),
            //         ),
            //         enabledBorder: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(20),
            //           borderSide:
            //               BorderSide(color: Colors.black.withOpacity(0.12)),
            //         ),
            //         hintText: "BUSINESS NAME",
            //         hintStyle: GoogleFonts.roboto(
            //           color: Colors.grey.shade200,
            //           fontWeight: FontWeight.w500,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Icon(
                      selected
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed('/agreement');
                      },
                      child: RichText(
                        maxLines: 2,
                        text: TextSpan(
                          text: 'I Agree to the ',
                          style: subtitle1.copyWith(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Terms and Conditions ",
                              style: subtitle1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            TextSpan(
                              text: "and ",
                              style: subtitle1.copyWith(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Data Privacy Policy ",
                              style: subtitle1.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),
            InkWell(
              onTap: () {
                if (selected) {
                  SharedPreferences.getInstance().then((value) {
                    value.setString('welcome', 'yes');
                    Get.toNamed('/about');
                  });
                } else {
                  showToast(
                      "Please accept to terms and conditions", Colors.red);
                }
              },
              child: Container(
                height: 60,
                width: getWidth(context),
                color: Colors.white,
                child: Center(
                  child: Text(
                    "NEXT",
                    style: subtitle,
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
