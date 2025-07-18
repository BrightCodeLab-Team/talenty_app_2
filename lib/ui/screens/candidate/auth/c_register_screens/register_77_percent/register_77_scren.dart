import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_77_percent/register_77_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_88_percent/register_88_screen.dart';

class Candidate77PercentScreen extends StatelessWidget {
  const Candidate77PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister77percentViewModel(),
      child: Consumer<CandidateRegister77percentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(
                  text: '77',
                  onTap: () {
                    Get.to(Candidate88PercentScreen());
                  },
                ),
              ),
            ),
      ),
    );
  }
}
