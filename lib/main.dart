// import 'dart:html';

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:responsiveui_container/responsiveui_container.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyTheme with ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }
}

MyTheme currentTheme = MyTheme();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: RContainer(
        mobile: MyHomePage(title: 'My Resume'),
        // tablet: TabHomePage(),
        // desktop: DesktopHomePage(),
      ),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownvalue = 'EN';

  var items = [
    'EN',
    'FR',
    'GR',
    'SP',
    'LA',
    'GU',
  ];

  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[50],
      //   title: Text(
      //     widget.title,
      //     style: TextStyle(color: Colors.black),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Spacer(),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'My Resume',
                        style: GoogleFonts.montserrat(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: const Icon(Icons.wb_sunny_outlined),
                      // color: Colors.black,
                      onPressed: () {
                        currentTheme.switchTheme();
                      },
                    ),
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 100.0,
                    child: Divider(
                      color: Colors.deepPurple,
                      thickness: 2.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2.0, color: Colors.deepPurple),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            child: Image.asset(
                              'images/henry.jpeg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ezeanyim Henry',
                          style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Mobile Developer',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 16.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 5.0, left: 0.0),
                            ),
                            Text(
                              'Enugu, Nigeria',
                              style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                launchUrlString('https:twitter.com');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.github,
                                size: 20.0,
                              ),
                              constraints: BoxConstraints(),
                            ),
                            IconButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                launchUrlString('https:twitter.com');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.twitter,
                                size: 20.0,
                              ),
                              constraints: BoxConstraints(),
                            ),
                            IconButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                launchUrlString('https:twitter.com');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.linkedinIn,
                                size: 20.0,
                              ),
                              constraints: BoxConstraints(),
                            ),
                            IconButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                launchUrlString('https:twitter.com');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.facebook,
                                size: 20.0,
                              ),
                              constraints: BoxConstraints(),
                            ),
                            IconButton(
                              color: Colors.deepPurple,
                              onPressed: () {
                                launchUrlString('https:twitter.com');
                              },
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                size: 20.0,
                              ),
                              constraints: BoxConstraints(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.deepPurple,
                  thickness: 2.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'I\'m on mobile track (Flutter & Dart). But I want to say that being a dev is beyond knowing how to code but how to solve problems. I\'m also a PHP/Laravel Developer, and I write other languages like javascript & C++. I\'m sure your team would need a problem solver.',
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            letterSpacing: 1.0,
                            textStyle: TextStyle()),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'My Skills',
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 150.0,
                    child: Divider(
                      color: Colors.deepPurple,
                      thickness: 1.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/html-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/css-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/javascript-programming-language-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/flutter-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/dart-programming-language-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 10,
                            // offset: Offset(4, 4),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/php-programming-language-icon.png',
                            width: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Row(
                  children: [
                    Text(
                      'What I can do for your company',
                      style: GoogleFonts.poppins(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 150.0,
                    child: Divider(
                      color: Colors.deepPurple,
                      thickness: 1.0,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        'My previous work experience includes innovation in many areas, including strategies for more effective teamwork. At my previous company, I devised strategies for improving teamwork and communication among members of team projects. I can bring to your organization not only my ideas from my previous job, but my general passion for innovation and problem solving too.',
                        style: GoogleFonts.lato(
                            fontStyle: FontStyle.normal,
                            fontSize: 12,
                            letterSpacing: 1.0,
                            textStyle: TextStyle()),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
