import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_55_percent/register_55_screen.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_66_percent/register_66_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_77_percent/register_77_scren.dart';

class Candidate66PercentScreen extends StatelessWidget {
  const Candidate66PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister66PercentViewModel(),
      child: Consumer<CandidateRegister66PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: '66',
                  onTap: () {
                    Get.to(Candidate77PercentScreen());
                  },
                ),
              ),
            ),
      ),
    );
  }
}
