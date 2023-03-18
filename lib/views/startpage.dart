import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:numidaselfservice/helpers/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final phonenumberController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              "NUMIDA",
              style: titleText.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 40, right: 40),
              child: Text(
                "GROW YOUR SELF WITH NUMIDA!",
                textAlign: TextAlign.center,
                style: subtitle1.copyWith(
                    color: secondaryColor, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "ENTER YOUR PHONE NUMBER",
              style: subtitle1.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Your account is linked to your phone number",
              style: subtitle2.copyWith(color: Colors.white),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IntlPhoneField(
                  disableLengthCheck: true,
                  controller: phonenumberController,
                  decoration: InputDecoration(
                    fillColor: primaryColor,
                    contentPadding: const EdgeInsets.all(8),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(color: Colors.black.withOpacity(0.12)),
                    ),
                    hintText: "701234567",
                    hintStyle: GoogleFonts.roboto(
                      color: kBlack.withOpacity(0.5),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  initialCountryCode: 'KE',
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                Text(
                  "YOUR PERSONAL DATA IS ALWAYS SECURE.",
                  style: subtitle4.copyWith(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed('/agreement');
                  },
                  child: Text(
                    "LEARN MORE.",
                    style: subtitle4.copyWith(color: secondaryColor),
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                if (phonenumberController.text.isNotEmpty &&
                    phonenumberController.text.length > 8) {
                  SharedPreferences.getInstance().then((value) {
                    value.setString('phone', phonenumberController.text);
                    Get.toNamed('/welcome');
                  });
                } else {
                  showToast("Enter phone number or phone number is incorrect",
                      Colors.red);
                }
              },
              child: Container(
                height: 60,
                width: getWidth(context),
                color: Colors.white,
                child: Center(
                  child: Text(
                    "START",
                    style: subtitle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
