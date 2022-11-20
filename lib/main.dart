import 'package:flutter/material.dart';
import 'package:multi_select_item/multi_select_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<bool> myBool = <bool>[false, false, false, false, false];
  List<String> listPopularFootballClubs = [
    'Regular Wash',
    'Regular Wash + Ironing',
    'Wash And Press',
    'Dry Cleaning',
    'Just Ironing'
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xff212427),
        body: Padding(
          padding: const EdgeInsets.only(right: 25, left: 25),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 400,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                      text: TextSpan(text: '', children: [
                    TextSpan(
                        text: 'Preparing your basket\n',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    TextSpan(
                        text: '\nCostumise ',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    TextSpan(
                        text: 'select how you wish to do\nyour laundry',
                        style: TextStyle(fontSize: 15, color: Colors.white))
                  ])),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: listPopularFootballClubs.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        myBool[index] = !myBool[index];
                      });
                    },
                    child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color:
                              myBool[index] ? Colors.white : Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(listPopularFootballClubs[index],
                                style: TextStyle(
                                    color: myBool[index]
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal)),
                          ),
                        )),
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: 27),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
