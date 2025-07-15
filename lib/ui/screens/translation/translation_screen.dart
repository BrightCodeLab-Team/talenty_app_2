import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/theme/lang_theme_provider.dart';

class TranslationScreen extends StatelessWidget {
  const TranslationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<LanThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('hello'.tr),
        actions: [
          IconButton(
            icon: Icon(
              themeProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: () => themeProvider.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text('hello'.tr, style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Get.updateLocale(const Locale('en')),
              child:  Text('Switch'.tr),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () => Get.updateLocale(const Locale('es')),
              child: Text('spanish'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
