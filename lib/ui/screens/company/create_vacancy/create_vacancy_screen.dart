// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/company/create_vacancy/create_vacancy_view_model.dart';

class CreateVacancyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateVacancyViewModel(),
      child: Consumer<CreateVacancyViewModel>(
        builder: (context, model, child) => Scaffold(),
      ),
    );
  }
}
