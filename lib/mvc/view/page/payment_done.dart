import 'package:elm/mvc/view/page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';
import '../widget/custom_widget.dart';

class PaymentDone extends StatelessWidget {
  const PaymentDone({Key? key}) : super(key: key);

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
                  Get.to(Home());
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
              margin: EdgeInsets.symmetric(horizontal: 400),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 72,
                      width: 250,
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
                              isActive: false,
                              state: StepState.disabled,
                            ),
                            Step(
                              title: Text(''),
                              content: SizedBox(),
                              isActive: true,
                              state: StepState.disabled,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150,
                      width: double.maxFinite,
                      child: Image.asset('assets/img 6.png'),
                    ),
                    SizedBox(
                      height: 40,
                      width: 220,
                      child: normalButton('PAYMENT COMPLETE', alternate, white,
                          onPressed: () {}),
                    ),
                    Column(
                      children: [
                        Text('Saturday Circle Progress',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: fontMedium,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Card(
                          elevation: 8,
                          color: white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: SizedBox(
                            height: 70,
                            width: double.maxFinite,
                            child: LinearPercentIndicator(
                              animation: true,
                              lineHeight: 15.0,
                              animationDuration: 1000,
                              percent: 0.4,
                              center: Text("40.0%"),
                              leading: Text(
                                "   £80.00",
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: fontVerySmall),
                              ),
                              // trailing: Text("40.0%"),
                              barRadius: Radius.circular(20),
                              progressColor: primaryColor,
                            ),
                          ),
                        ),
                      ],
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
