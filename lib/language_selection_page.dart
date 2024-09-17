import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> locales = [
      {'name': 'English', 'locale': const Locale('en', 'US')},
      {'name': 'हिन्दी', 'locale': const Locale('hi', 'IN')},
      {'name': 'मराठी', 'locale': const Locale('mr', 'IN')},
      {'name': 'ಕನ್ನಡ', 'locale': const Locale('kn', 'IN')},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('choose_language'.tr),
      ),
      body: ListView.separated(
        itemCount: locales.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final locale = locales[index];
          return ListTile(
            title: Text(locale['name']),
            onTap: () {
              Get.updateLocale(locale['locale']);
              Get.offNamed('/homepage');
              Get.forceAppUpdate();
              // Navigate to homepage after selecting language
            },
          );
        },
      ),
    );
  }
}