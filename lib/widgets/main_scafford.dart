import 'package:flutter/material.dart';
import 'package:order_food_fe/constants/app_colors.dart';
import 'package:order_food_fe/constants/app_styles.dart';
import 'package:order_food_fe/pages/control_page.dart';
import 'package:order_food_fe/pages/home_page.dart';
import 'package:order_food_fe/widgets/app_button.dart';

class MainScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String title;
  final Widget body;
  bool? isShowFloatingButton = false;
  Function()? onPressMenu;
  Function()? onPressFloatingButton;

  MainScaffold(
      {Key? key,
      required this.scaffoldKey,
      required this.title,
      required this.body,
      this.onPressMenu,
      this.isShowFloatingButton,
      this.onPressFloatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        title: Text(title),
        leading: InkWell(
          onTap: () {
            scaffoldKey.currentState?.openDrawer();
            onPressMenu?.call();
          },
          child: const Icon(Icons.menu),
        ),
      ),
      body: body,
      floatingActionButton: isShowFloatingButton == true
          ? FloatingActionButton(
              child: const Icon(Icons.refresh),
              backgroundColor: Colors.blueAccent,
              onPressed: onPressFloatingButton,
            )
          : null,
      drawer: Drawer(
        backgroundColor: AppColors.primaryColor,
        child: SafeArea(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Text(
                  "Your mind",
                  style: AppStyles.h3,
                ),
                AppButton(
                  title: "English Today",
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false,
                    );
                  },
                ),
                AppButton(
                  title: "Favorites",
                  onTap: () {},
                ),
                AppButton(
                  title: "Your control",
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ControlPage(),
                      ),
                      (route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
