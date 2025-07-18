import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_22_percent/register_22_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_44_percent/register_44_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_55_percent/register_55_screen.dart';

class Candidate44PercentScreen extends StatelessWidget {
  const Candidate44PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister44PercentViewModel(),
      child: Consumer<CandidateRegister44PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: '44',
                  onTap: () {
                    Get.to(Candidate55PercentScreen());
                  },
                ),
              ),
              body: Column(children: []),
            ),
      ),
    );
  }
}
