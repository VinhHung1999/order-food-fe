import 'dart:math';

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:order_food_fe/constants/app_styles.dart';
import 'package:order_food_fe/constants/shared_keys.dart';
import 'package:order_food_fe/models/english_today.dart';
import 'package:order_food_fe/widgets/main_scafford.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;

  int _wordLength = 5;

  late PageController _pageController;
  late PageController _listViewController;

  List<EnglishToday> words = [];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<int> fixedListRandom({int len = 1, int max = 120, int min = 1}) {
    if (len > max || len < min) {
      return [];
    }
    List<int> newList = [];

    Random random = Random();

    int count = 1;
    while (count <= len) {
      int randomInt = random.nextInt(max) + 1;
      if (!newList.contains(randomInt)) {
        newList.add(randomInt);
        count++;
      }
    }
    return newList;
  }

  void getEnglistToday({int len = 5}) {
    List<String> newList = [];
    List<int> listRandom = fixedListRandom(len: len, max: nouns.length);
    listRandom.forEach((element) {
      newList.add(nouns[element]);
    });

    setState(() {
      words = newList.map((e) => EnglishToday(noun: e)).toList();
    });
  }

  onChangePage(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  initData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int wordLength = prefs.getInt(ShareKeys.wordLength) ?? 5;
    _wordLength = wordLength;
    getEnglistToday(len: wordLength);
  }

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController();
    _listViewController = PageController();
    initData();
    super.initState();
  }

  void resetData() async {
    getEnglistToday(len: _wordLength);
    _pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    _listViewController.animateToPage(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MainScaffold(
        scaffoldKey: _scaffoldKey,
        title: "English Today",
        isShowFloatingButton: true,
        onPressFloatingButton: resetData,
        body: HomeBodyWidget(size));
  }

  Widget buildIndicator(int index, Size size) {
    return GestureDetector(
      onTap: () => {
        _pageController.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.easeIn)
      },
      child: Container(
        width: index == _currentPage ? size.width * 1 / 5 : 24,
        height: 20,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        decoration: BoxDecoration(
          color: index == _currentPage ? Colors.lightBlue : Colors.lightGreen,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget HomeBodyWidget(Size size) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        alignment: Alignment.topLeft,
        child: Column(
          children: [
            Container(
              padding: AppStyles.primaryPadding,
              height: size.height * 1 / 10,
              child: const Text(
                  '"It is amazing how complete is the delusion that beauty it goodness"'),
            ),
            SizedBox(
              height: size.height * 2 / 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: onChangePage,
                itemCount: words.length,
                itemBuilder: (context, index) {
                  String? firstLetter = words[index].noun?.substring(0, 1);
                  String? leftLetter = words[index]
                      .noun
                      ?.substring(1, words[index].noun!.length);
                  return Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 61, 184, 255),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0, 5),
                            blurRadius: 6,
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          child: const Icon(Icons.monitor_heart),
                        ),
                        RichText(
                          maxLines: 1,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                            text: firstLetter,
                            style: const TextStyle(
                              fontSize: 89,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(0, 5),
                                  blurRadius: 6,
                                )
                              ],
                            ),
                            children: [
                              TextSpan(
                                text: leftLetter,
                                style: const TextStyle(
                                  fontSize: 70,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      offset: Offset(0, 0),
                                      blurRadius: 6,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Text(
                            '"Think of all the beauty still left around you and be happy"',
                            style: AppStyles.h4.copyWith(
                              color: Colors.black,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 25,
              child: ListView.builder(
                controller: _listViewController,
                scrollDirection: Axis.horizontal,
                itemCount: words.length,
                padding: const EdgeInsets.symmetric(vertical: 2),
                itemBuilder: (context, index) {
                  return buildIndicator(index, size);
                },
              ),
            ),
            // Container(
            //   height: 10,
            //   color: Colors.red,
            // )
          ],
        ),
      ),
    );
  }
}
