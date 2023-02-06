import 'package:elm/constant/color.dart';
import 'package:elm/mvc/view/page/quick_donate.dart';
import 'package:elm/mvc/view/page/site_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/value.dart';
import '../../controller/home_controller.dart';
import '../widget/custom_widget.dart';
import 'general_donation.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 130, vertical: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/Untitled-1.png', fit: BoxFit.cover),
                    Text('Ibn Umer narrated:',
                        style: TextStyle(
                            fontSize: fontMedium, color: primaryText)),
                    Text(
                        '"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: fontMedium,
                            color: primaryText,
                            fontWeight: FontWeight.bold)),
                    Text('Jami at-Tirmighi 531',
                        style: TextStyle(
                            fontSize: fontMedium, color: primaryText)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logoo.png',
                            height: 70, fit: BoxFit.cover),
                        SizedBox(width: 8),
                        Text(
                          "EAST LONDON MOSQUE & \n LONDON MUSLIM CENTRE",
                          style: TextStyle(
                              fontSize: fontMediumExtra, color: primaryColor),
                        ),
                      ],
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                color: primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 50,
                            child: iconTextBtn(
                                'assets/Donate Icon.png',
                                'DONATE',
                                Colors.transparent,
                                white, onPressed: () {
                              Get.to(QuickDonate(homeController.projectList.value));
                            }),
                          ),
                          SizedBox(width: 50),
                          SizedBox(
                            height: 70,
                            width: 50,
                            child: iconTextBtn('assets/Map Icon.png', 'MAP',
                                Colors.transparent, white, onPressed: () {
                              Get.to(SiteMap());
                            }),
                          ),
                          SizedBox(width: 50),
                          SizedBox(
                            height: 70,
                            width: 50,
                            child: iconTextBtn('assets/Help Icon.png', 'HELP',
                                Colors.transparent, white, onPressed: () {
                              // Get.to(QuickDonate());
                            }),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Obx(() {
                        return ListView.builder(
                            itemCount: homeController.projectList.length,
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            itemBuilder: (context, index) {
                              return Container(
                                height: 160,
                                margin: const EdgeInsets.only(bottom: 15.0),
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.asset(
                                            'assets/new 1.png',
                                            height: Size.infinite.height,
                                            width: Size.infinite.width,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        flex: 6,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection: Axis.vertical,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      homeController.projectList
                                                          .value[index].name,
                                                      style: TextStyle(
                                                          fontSize: fontMedium,
                                                          color: primaryColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        homeController
                                                            .projectList
                                                            .value[index]
                                                            .title,
                                                        style: TextStyle(
                                                            fontSize:
                                                                fontMedium,
                                                            color: primaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                    Text(
                                                        homeController
                                                            .projectList
                                                            .value[index]
                                                            .description,
                                                        style: TextStyle(
                                                            fontSize:
                                                                fontVerySmall,
                                                            color: primaryText,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                cartBottomItem(
                                                    'Target Amount',
                                                    homeController.projectList
                                                        .value[index].needAmount
                                                        .toString()),
                                                // cartBottomItem('Zakat', homeController.projectList.value[index].zakat),
                                                cartBottomItem(
                                                    'Zakat', 'not eligible'),
                                                SizedBox(
                                                    height: 40,
                                                    width: 125,
                                                    child: normalButton(
                                                        "Donate Now",
                                                        alternate,
                                                        white, onPressed: () {
                                                      Get.to(GeneralDonation(
                                                          homeController
                                                              .projectList
                                                              .value[index]));
                                                    })),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget cartBottomItem(String type, String amount) {
    return Container(
      height: 40,
      width: 125,
      decoration: BoxDecoration(
        color: primaryBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/Icon.png',
                  height: Size.infinite.height,
                  width: Size.infinite.width,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              flex: 6,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    type,
                    style: TextStyle(fontSize: 10, color: primaryText),
                  ),
                  Text('\$$amount',
                      style: TextStyle(
                          fontSize: fontVerySmall,
                          color: primaryText,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
