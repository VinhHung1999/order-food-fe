import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:order_food_fe/constants/app_colors.dart';
import 'package:order_food_fe/constants/app_styles.dart';
import 'package:order_food_fe/pages/home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome to",
                  style: AppStyles.h3.copyWith(color: Colors.white),
                ),
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "English",
                      style: AppStyles.h2.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    ),
                    Text(
                      "Quoters",
                      style: AppStyles.h4.copyWith(color: Colors.white),
                      textAlign: TextAlign.right,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.topCenter,
                    child: RawMaterialButton(
                      shape: CircleBorder(),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => HomePage()),
                            (route) => false);
                      },
                      child: const Icon(Icons.arrow_forward),
                      fillColor: Colors.white,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
