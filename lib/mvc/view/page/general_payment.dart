import 'package:elm/constant/value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../widget/custom_widget.dart';
import 'card_machine_page.dart';

class GeneralPayment extends StatefulWidget {
  GeneralPayment(this.moneySelected, this.withGift, this.id, {Key? key})
      : super(key: key);
  int moneySelected;
  int id;

  bool withGift;

  @override
  State<GeneralPayment> createState() => _GeneralPaymentState();
}

class _GeneralPaymentState extends State<GeneralPayment> {
  String payType = "Card"; //if you want to set default value
  // bool withGift = false;
  int totals = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.withGift) {
      totals = widget.moneySelected + 20;
    } else {
      totals = widget.moneySelected;
    }
    setState(() {});
  }

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
                onPressed: () {
                  Get.back();
                },
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
              color: white,
              elevation: 5,
              margin: EdgeInsets.symmetric(horizontal: 340),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 72,
                      width: 300,
                      child: Theme(
                        data: ThemeData(canvasColor: white),
                        child: Stepper(
                          type: StepperType.horizontal,
                          currentStep: 0,
                          elevation: 0,
                          margin: EdgeInsets.zero,
                          steps: <Step>[
                            Step(
                              title: Text(''),
                              content: SizedBox(),
                              isActive: true,
                              state: StepState.disabled,
                            ),
                            Step(
                              title: Text(''),
                              content: SizedBox(),
                              isActive: false,
                              state: StepState.disabled,
                            ),
                            Step(
                              title: Text(''),
                              content: SizedBox(),
                              isActive: false,
                              state: StepState.disabled,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text('Your',
                        style:
                            TextStyle(color: primaryColor, fontSize: fontBig)),
                    Text('Saturday Circles',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontVeryBig,
                            fontWeight: FontWeight.bold)),
                    Text('Donation',
                        style:
                            TextStyle(color: primaryColor, fontSize: fontBig)),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: primaryColor, width: 1.5)),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 4,
                                  child: const Text('TOTAL',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: fontSmall))),
                              widget.withGift
                                  ? Expanded(
                                      flex: 5,
                                      child: Container(
                                        height: double.maxFinite,
                                        decoration: BoxDecoration(
                                            // color: textSecondary,
                                            border: Border(
                                          left: BorderSide(
                                              color: primaryColor, width: 1.5),
                                        )),
                                        alignment: Alignment.center,
                                        child: Text(
                                            '£${widget.moneySelected} + £20.00',
                                            style: TextStyle(
                                                color: primaryColor,
                                                fontSize: fontSmall)),
                                      ),
                                    )
                                  : SizedBox(),
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
                                  child: Text('£$totals',
                                      style: TextStyle(
                                          color: white, fontSize: fontSmall)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        TextButton(
                          child: Text('CLICK HERE TO ADD 25% WITH GIFT AID',
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: fontVerySmall)),
                          onPressed: () {
                            setState(() {
                              widget.withGift == true
                                  ? widget.withGift = false
                                  : widget.withGift = true;
                            });
                          },
                        ),
                      ],
                    ),
                    widget.withGift
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
                        height: 50,
                        child: normalButton("Pay Now", alternate, white,
                            onPressed: () {
                          Get.to(const CardPage());
                        })),
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
