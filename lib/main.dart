// import 'dart:html';

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:responsiveui_container/responsiveui_container.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:language_builder/language_builder.dart';

import 'languages.dart';

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

void main() async {
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
      // print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Resume',
      // home: LanguageBuilder(
      //   useDeviceLanguage: false,
      //   defaultLanguage: 'en',
      //   textsMap: Languages.languages,
      //   child: const MyHomePage(title: 'My Resume'),
      //   splash: Container(),
      // ),
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: currentTheme.currentTheme(),
      home: LanguageBuilder(
        useDeviceLanguage: false,
        defaultLanguage: 'en',
        textsMap: Languages.languages,
        // splash: Container(),
        child: RContainer(
          mobile: MyHomePage(title: 'My Resume'),
          // tablet: TabHomePage(),
          // desktop: DesktopHomePage(),
        ),
      ),
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
  String dropdownvalue = LanguageBuilder.getCurrentLang();
  Map<String, dynamic> texts = {};

  var items = LanguageBuilder.getAvailableLanguages();

  // var items = ['en', 'sp'];

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
                        LanguageBuilder.texts!['main_page']['title'],
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
                        // var e = 'en';
                        if (newValue != LanguageBuilder.getCurrentLang()) {
                          LanguageBuilder.changeLanguage(newValue!, context);
                        }
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
                          LanguageBuilder.texts!['main_page']['work'],
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
                                launchUrlString(
                                    'https://github.com/ezeanyimhenry');
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
                                launchUrlString(
                                    'https://twitter.com/ezeanyim_henry?s=21&t=4SoudZssS29MATt5LJyCXA');
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
                                launchUrlString(
                                    'https://www.linkedin.com/in/ezeanyim-henry-3b7360171/');
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
                                launchUrlString(
                                    'https://www.facebook.com/ezeanyim.henry/');
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
                                launchUrlString(
                                    'https://www.instagram.com/ezeanyimhenry/');
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
                        LanguageBuilder.texts!['main_page']['about'],
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
                      LanguageBuilder.texts!['main_page']['skill'],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/html-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'HTML',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/css-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'CSS',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/javascript-programming-language-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'JAVASCRIPT',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/flutter-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'FLUTTER',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/dart-programming-language-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'DART',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                'images/php-programming-language-icon.png',
                                width: 50.0,
                              ),
                              Text(
                                'PHP',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
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
                    Flexible(
                      child: Text(
                        LanguageBuilder.texts!['main_page']['duty'],
                        style: GoogleFonts.poppins(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
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
                        LanguageBuilder.texts!['main_page']['dutyy'],
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
