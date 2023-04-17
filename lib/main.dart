import 'package:flutter/material.dart';
import 'package:order_food_fe/constants/app_images.dart';
import 'package:order_food_fe/pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: LandingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class ButtonCounter extends StatefulWidget {
//   final String title;

//   const ButtonCounter({Key? key, this.title = ""}) : super(key: key);

//   @override
//   State<ButtonCounter> createState() => _ButtonCounterState();
// }

// class _ButtonCounterState extends State<ButtonCounter> {
//   int _counter = 0;
//   String _title = "";

//   onChangeState() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _title = widget.title.toUpperCase();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   void didUpdateWidget(covariant ButtonCounter oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   void deactivate() {
//     // TODO: implement deactivate
//     super.deactivate();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         children: [
//           Text('$_counter'),
//           ElevatedButton.icon(
//             onPressed: onChangeState,
//             icon: const Icon(Icons.plus_one_outlined),
//             label: const Text("Cong"),
//           ),
//           Image.asset(
//             AppImages.iconHung,
//             width: 100,
//             height: 100,
//           )
//         ],
//       ),
//     );
//   }
// }
