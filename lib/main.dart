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
  List<String> listPopularFootballClubs = [];

  @override
  // ignore: must_call_super
  initState() {
    super.initState();
    listPopularFootballClubs = [
      'Regular Wash',
      'Regular Wash + Ironing',
      'Wash And Press',
      'Dry Cleaning',
      'Just Ironing'
    ];
  }

  final List<bool> myBool = <bool>[false, false, false, false, false];
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
                        child: Card(
                          color:
                              myBool[index] ? Colors.white : Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                          ),
                          child: Center(
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



//  ListView.separated(
//                 scrollDirection: Axis.vertical,
//                 shrinkWrap: true,
//                 padding: const EdgeInsets.all(8),
//                 itemCount: entries.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                         border: Border.all(color: Colors.white),
//                         borderRadius: BorderRadius.circular(10)),
//                     child: Center(
//                         child: Text(
//                       'Entry ${entries[index]}',
//                       style: TextStyle(color: Colors.white),
//                     )),
//                   );
//                 },
//                 separatorBuilder: (BuildContext context, int index) =>
//                     const Divider(),
//               ),