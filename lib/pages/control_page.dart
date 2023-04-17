import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:order_food_fe/constants/app_colors.dart';
import 'package:order_food_fe/constants/app_styles.dart';
import 'package:order_food_fe/constants/shared_keys.dart';
import 'package:order_food_fe/widgets/main_scafford.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double sliderValue = 5;

  onSaveWordsLength() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
// Save an integer value to 'counter' key.
    await prefs.setInt(ShareKeys.wordLength, sliderValue.toInt());
  }

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      scaffoldKey: scaffoldKey,
      title: "Control",
      onPressMenu: onSaveWordsLength,
      body: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "How much a number word at once",
                style: AppStyles.h4
                    .copyWith(color: Colors.lightBlueAccent, fontSize: 18),
              ),
              Text(
                '${sliderValue.toInt().toString()}',
                style: AppStyles.h2.copyWith(
                    color: Colors.lightBlueAccent,
                    fontSize: 150,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "Slide to Set",
                style: AppStyles.h4.copyWith(
                  color: Colors.black,
                ),
              ),
              Slider(
                value: sliderValue,
                min: 1,
                max: 100,
                // divisions: 9,
                label: sliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
            ],
          )),
    );
  }
}
