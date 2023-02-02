import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../widget/custom_widget.dart';
import 'card_machine_page.dart';

class QuickDonate extends StatefulWidget {
  const QuickDonate({Key? key}) : super(key: key);

  @override
  State<QuickDonate> createState() => _QuickDonateState();
}

class _QuickDonateState extends State<QuickDonate> {
  String payType = "Card"; //if you want to set default value
  bool withGift = false;
  List<String> donateType = ['Choose Donation Type', 'Sadaqah', 'Lillah', 'Zakah', 'Zakatul Fitr'];

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
                      'HOME',
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
              color: white,
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 350),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Quick Donate',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontVeryBig,
                            fontWeight: FontWeight.bold)),
                    Container(
                        height: 50,
                        width: 300,
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 18,
                              width: 18,
                              child: Image.asset(
                                'assets/Donate Icon.png',
                                color: white,
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: DropdownButton<String>(
                                items: donateType.map((dynamic val) {
                                  return DropdownMenuItem<String>(
                                    value: val,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(val,
                                          style: TextStyle(
                                              color: white,
                                              fontSize: fontVerySmall)),
                                    ),
                                  );
                                }).toList(),
                                borderRadius: BorderRadius.circular(10),
                                underline: SizedBox(),
                                isExpanded: true,
                                dropdownColor: primaryColor,
                                value: donateType[0],
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: fontVerySmall),
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 60,
                      width: double.maxFinite,
                      child: Row(
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
                            height: 55,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: primaryColor, width: 1.5)),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 4,
                                    child: const Text('OTHER\nAMOUNT',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: fontVerySmall))),
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    child: WheelChooser(
                                      onValueChanged: (s) => print(s),
                                      datas: [
                                        for (int i = 1; i < 20; i++) '\$$i'
                                      ],
                                      itemSize: 20,
                                      magnification: 1.2,
                                      selectTextStyle: TextStyle(color: white),
                                      unSelectTextStyle:
                                          TextStyle(color: white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    TextButton(
                      child: Text('CLICK HERE TO ADD 25% WITH GIFT AID',
                          style: TextStyle(
                              color: primaryColor, fontSize: fontVerySmall)),
                      onPressed: () {
                        setState(() {
                          withGift == true ? withGift = false : withGift = true;
                        });
                      },
                    ),
                    withGift
                        ? Column(
                            children: [
                              SizedBox(
                                width: double.maxFinite,
                                height: 50,
                                child: normalTextField(TextEditingController(),
                                    'Full Name', Icons.person),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: double.maxFinite,
                                height: 50,
                                child: normalTextField(TextEditingController(),
                                    'Email Address', Icons.mail),
                              ),
                              SizedBox(height: 5),
                              SizedBox(
                                width: double.maxFinite,
                                height: 50,
                                child: normalTextField(TextEditingController(),
                                    'Home Address', Icons.location_on_rounded),
                              ),
                            ],
                          )
                        : SizedBox(),
                    Column(
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 6),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.payment,
                                color: white,
                              ),
                              Text(
                                'Card Machine',
                                style: TextStyle(color: white),
                              ),
                              Radio(
                                value: "Card",
                                activeColor: white,
                                groupValue: payType,
                                onChanged: (value) {
                                  setState(() {
                                    payType = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 6),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.apple,
                                color: white,
                              ),
                              Text(
                                'Apple Pay',
                                style: TextStyle(color: white),
                              ),
                              Radio(
                                value: "Apple",
                                // focusColor: white,
                                activeColor: white,
                                groupValue: payType,
                                onChanged: (value) {
                                  setState(() {
                                    payType = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 50,
                          margin: EdgeInsets.only(bottom: 6),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: primaryColor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.add_card,
                                color: white,
                              ),
                              Text(
                                'Google Pay',
                                style: TextStyle(color: white),
                              ),
                              Radio(
                                value: "Google",
                                // focusColor: white,
                                activeColor: white,
                                groupValue: payType,
                                onChanged: (value) {
                                  setState(() {
                                    payType = value!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: primaryColor, width: 1.5)),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 4,
                                      child: const Text('TOTAL',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: fontSmall))),
                                  Expanded(
                                    flex: 5,
                                    child: Container(
                                      height: double.maxFinite,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              bottomRight: Radius.circular(10)),
                                          color: primaryColor,
                                          border: Border.all(
                                              color: primaryColor, width: 1.5)),
                                      alignment: Alignment.center,
                                      child: Text('£80.00',
                                          style: TextStyle(
                                              color: white,
                                              fontSize: fontSmall)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                                height: 50,
                                child: normalButton("Pay Now", alternate, white,
                                    onPressed: () {
                                  Get.to(const CardPage());
                                })),
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
}
