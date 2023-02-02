
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../widget/custom_widget.dart';
import 'payment_done.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scanComplete();
  }

  Future<void> scanComplete() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.to(const PaymentDone());
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
                              isActive: false,
                              state: StepState.disabled,
                            ),
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
                          ],
                        ),
                      ),
                    ),
                    Text('Your Payment',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontVeryBig,
                            fontWeight: FontWeight.bold)),
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
                                      color: white, fontSize: fontSmall)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 80,
                      width: double.maxFinite,
                      child: Image.asset('assets/img 5.png'),
                    ),
                    Text('PLEASE FOLLOW THE\nINSTRUCTIONS ON THE\nCARD MACHINE BELOW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: fontMedium,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 40,
                      width: 220,
                      child: borderButton(
                          'CANCEL DONATION', Colors.transparent, primaryColor, primaryColor,
                          onPressed: () {
                            Get.to(const PaymentDone());
                          }),
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
