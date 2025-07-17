import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_77_percent/register_77_view_model.dart';

class Candidate77PercentScreen extends StatelessWidget {
  const Candidate77PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister77percentViewModel(),
      child: Consumer<CandidateRegister11PercentViewModel>(
        builder: (context, model, child) => Scaffold(),
      ),
    );
  }
}
