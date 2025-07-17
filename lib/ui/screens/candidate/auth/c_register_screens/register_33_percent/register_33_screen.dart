import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_11_percent/candidate_register_11_percent_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_22_percent/register_22_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/auth/c_register_screens/register_33_percent/register_33_view_model.dart';

class Candidate33PercentScreen extends StatelessWidget {
  const Candidate33PercentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateRegister33PercentViewModel(),
      child: Consumer<CandidateRegister11PercentViewModel>(
        builder: (context, model, child) => Scaffold(),
      ),
    );
  }
}
