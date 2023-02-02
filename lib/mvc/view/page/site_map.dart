import 'package:flutter/material.dart';
import '../../../constant/color.dart';
import '../../../constant/value.dart';

class SiteMap extends StatelessWidget {
  const SiteMap({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.symmetric(vertical: 120, horizontal: 160),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Site Map',
                            style: TextStyle(
                                color: white,
                                fontSize: fontBig,
                                fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            for (int i = 0; i < 8; i++)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: MaterialButton(
                                      elevation: 0,
                                      onPressed: () {},
                                      color: white,
                                      // height: 20,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.0),
                                      ),
                                      child: Text(
                                        i.toString(),
                                        style: TextStyle(color: primaryColor),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PROJECTS ON THIS FLOOR',
                              style: TextStyle(
                                  color: white, fontSize: fontVerySmall),
                            ),
                            SizedBox(height: 10),
                            for (int i = 0; i < 8; i++)
                              Text('•  East London Mosque',
                                  style: TextStyle(
                                      color: white, fontSize: fontVerySmall)),
                          ],
                        ),
                        SizedBox(height: 250, width: 250,child: Image.asset("assets/Map Icon.png"))
                      ],
                    )
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
