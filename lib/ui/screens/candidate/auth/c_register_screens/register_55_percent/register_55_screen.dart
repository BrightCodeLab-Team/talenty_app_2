import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';

import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_55_percent/register_55_view_model.dart';

class Candidate55PercentScreen extends StatelessWidget {
  const Candidate55PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Candidate55PercentRegisterViewModelModel(),
      child: Consumer<CandidateRegister11PercentViewModel>(
        builder: (context, model, child) => Scaffold(),
      ),
    );
  }
}
