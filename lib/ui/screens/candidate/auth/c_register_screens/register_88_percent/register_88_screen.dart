import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_100_percent/register_100_screen.dart';

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_88_percent/register_88_view_model.dart';

class Candidate88PercentScreen extends StatelessWidget {
  const Candidate88PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister88PercentViewModel(),
      child: Consumer<CandidateRegister88PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: '88',
                  onTap: () {
                    Get.to(Candidate100PercentScreen());
                  },
                ),
              ),
            ),
      ),
    );
  }
}
