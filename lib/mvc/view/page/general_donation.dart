import 'package:elm/constant/color.dart';
import 'package:elm/constant/value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../widget/custom_widget.dart';
import 'general_payment.dart';

class GeneralDonation extends StatelessWidget {
  const GeneralDonation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MaterialButton(
                elevation: 0,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'BACK',
                      style: TextStyle(color: white),
                    )
                  ],
                ),
              ),
              Image.asset(
                'assets/logoo.png',
                height: 40,
                fit: BoxFit.cover,
                color: white,
              ),
            ],
          ),
          Expanded(
            child: Card(
              color: secondaryColor,
              elevation: 5,
              margin: const EdgeInsets.all(70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'YOUTH PROJECT',
                            style: TextStyle(
                                color: white, fontSize: fontVerySmall),
                          ),
                          Text(
                            'Saturday Circles',
                            style:
                                TextStyle(color: white, fontSize: fontVeryBig),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Image.asset(
                              'assets/new 5.png',
                              // height: Size.infinite.height,
                              // width: Size.infinite.width,
                              // fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              carTopItem('Target Amount', ''),
                              SizedBox(width: 8),
                              carTopItem('Zakat', ''),
                            ],
                          ),
                          Text(
                              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod et dolore magna aliquam erat volutpat. Loremipsum dolor sit amet, consectetuer adipiscing elit,Ssed diam nonummy nibh euismod tincidunt ut laoreet dolore magnaaliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrudexerci tation ullamcorper suscipit lobortis nisl ut aliquip ex eacommodo consequat. Duis autem vel eum",
                              textAlign: TextAlign.justify,
                              style:
                                  TextStyle(fontSize: fontSmall, color: white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              roundButton('\$5', alternate, white,
                                  onPressed: () {}),
                              roundButton('\$5', alternate, white,
                                  onPressed: () {}),
                              roundButton('\$5', alternate, white,
                                  onPressed: () {}),
                              roundButton('\$5', alternate, white,
                                  onPressed: () {}),
                              Container(
                                height: 60,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: white, width: 1.5)),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 4,
                                        child: const Text('OTHER\nAMOUNT',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: white,
                                                fontSize: fontVerySmall))),
                                    Expanded(
                                      flex: 5,
                                      child: Container(
                                        color: white,
                                        child: WheelChooser(
                                          onValueChanged: (s) => print(s),
                                          datas: [
                                            for (int i = 1; i < 20; i++) '\$$i'
                                          ],
                                          itemSize: 20,
                                          magnification: 1.2,
                                          selectTextStyle:
                                              TextStyle(color: primaryColor),
                                          unSelectTextStyle:
                                              TextStyle(color: primaryColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 55,
                                width: 280,
                                child: borderButton(
                                    'ADD GIFT AID', Colors.transparent, white, white,
                                    onPressed: () {}),
                              ),
                              SizedBox(
                                  height: 55,
                                  width: 280,
                                  child: normalButton(
                                      "Pay Now", alternate, white,
                                      onPressed: () {
                                        Get.to(const GeneralPayment());
                                      })),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget carTopItem(String type, String amount) {
    return Container(
      height: 50,
      width: 125,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: white, width: 1.5)),
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
                    style: TextStyle(fontSize: 10, color: white),
                  ),
                  Text('\$12,000',
                      style: TextStyle(
                          fontSize: fontVerySmall,
                          color: white,
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
