import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_100_percent/register_100_view_model.dart';

class Candidate100PercentScreen extends StatelessWidget {
  const Candidate100PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister100PercentViewModel(),
      child: Consumer<CandidateRegister100PercentViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: Padding(
                padding: EdgeInsetsGeometry.all(15),
                child: CustomButton(text: '100', onTap: () {}),
              ),
            ),
      ),
    );
  }
}
