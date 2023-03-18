import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/aboutnumidacontroller.dart';
import '../helpers/utils.dart';

class AboutNumida extends StatelessWidget {
  AboutNumida({super.key});
  final controller = Get.put(AboutController());

  @override
  Widget build(context) => GetBuilder<AboutController>(
      builder: (_) => Scaffold(
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
                      height: 50,
                    ),
                    SizedBox(
                      width: getWidth(context),
                      height: 550,
                      child: PageView(
                        controller: controller.pageController,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (value) {
                          print(value);
                          controller.setScreen(value);
                          controller.pageController.animateToPage(value,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeOut);
                        },
                        physics: const BouncingScrollPhysics(),
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 170,
                                width: getWidth(context),
                                decoration: BoxDecoration(
                                    color:
                                        primaryColor.withOpacity(0.18),
                                    shape: BoxShape.circle,
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/about.png"))),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "About Numida",
                                  style: titleText1.copyWith(
                                      color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "We help you achieve your financial growth by giving you a loan within 72 hours.",
                                        style: subtitle.copyWith(
                                            color: Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 5,
                                        width: 5,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black)),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      "No security required!",
                                      textAlign: TextAlign.center,
                                      style: subtitle.copyWith(
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                          Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  height: 170,
                                  width: getWidth(context),
                                  decoration: BoxDecoration(
                                      color: primaryColor
                                          .withOpacity(0.18),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              "assets/images/apply.png"))),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "How to apply",
                                    style: titleText1.copyWith(
                                        color: Colors.grey),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 5,
                                          width: 5,
                                          decoration:
                                              const BoxDecoration(
                                                  shape:
                                                      BoxShape.circle,
                                                  color:
                                                      Colors.black)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: Text(
                                          "Simply upload your personal details & photos into the app to apply",
                                          style: subtitle.copyWith(
                                              color: Colors.grey,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                          height: 5,
                                          width: 5,
                                          decoration:
                                              const BoxDecoration(
                                                  shape: BoxShape
                                                      .circle,
                                                  color: Colors
                                                      .black)),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        "We'll review and verify them!",
                                        style: subtitle.copyWith(
                                            color: Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                )
                              ],
                            ),
                          
                          Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 170,
                                  width: getWidth(context),
                                  decoration: BoxDecoration(
                                      color: primaryColor
                                          .withOpacity(0.18),
                                      shape: BoxShape.circle,
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            "assets/images/quality.png"))),
                              ),
                              const SizedBox(
                                  height: 20,
                                ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Do you qualify?",
                                    style: titleText1.copyWith(
                                        color: Colors.grey),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black)),
                                            const SizedBox(width: 10,),
                                    Expanded(
                                      child: Text(
                                        "Find out the amount, interest and loan term by answering the next few questions",
                                        style: subtitle1.copyWith(
                                            color: Colors.grey,
                                            fontSize: 18),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    Container(
                                        height: 10,
                                        width: 10,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black)),
                                            const SizedBox(width: 10,),
                                    Text(
                                      "No field visits  required!",
                                      textAlign: TextAlign.center,
                                      style: subtitle1.copyWith(
                                          color: Colors.grey,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: kAnimationDuration,
                          margin: const EdgeInsets.only(right: 5),
                          height: 6,
                          width: controller.currentIndex == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: controller.currentIndex == index
                                ? primaryColor
                                : const Color(0xFFD8D8D8),
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
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
                          if (controller.currentIndex < 2) {
                            var value = controller.currentIndex + 1;
                            controller.setScreen(value);
                            controller.pageController.animateToPage(value,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeOut);
                          } else {
                            SharedPreferences.getInstance().then((value) {
                              value.setString('about', 'yes');
                              Get.toNamed('/over18years');
                            });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Center(
                            child: _.currentIndex == 2
                                ? Text(
                                    "CONTINUE",
                                    style: subtitle2.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
          ));
}
