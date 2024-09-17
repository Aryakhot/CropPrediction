import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'homepage.dart';
import 'language_selection_page.dart';
import 'locale_string.dart';  // Import AgroConnectScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: LocalString(),
      locale: const Locale('en', 'US'), // Default locale
      fallbackLocale: const Locale('en', 'US'), // Fallback locale
      title: 'AgroConnect',
      theme: ThemeData(
        primaryColor: const Color(0xFFFFFFFF),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/language',
      // Set the initial route to the language selection page
      getPages: [
        GetPage(name: '/language', page: () => const LanguageSelectionPage()),
        GetPage(name: '/homepage', page: () =>  AgroConnectScreen()),
      ],
      // home: AgroConnectScreen(),  // Set AgroConnectScreen as the initial screen
      // routes: {
      //   '/homepage': (context) => AgroConnectScreen(),  // Define the route for homepage
      // },
    );
  }
}