import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/ui/screens/candidate/matches/candidate_matches_view_model.dart';

class CandidateMatchesScreen extends StatelessWidget {
  const CandidateMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateMatchesViewModel(),
      child: Consumer<CandidateMatchesViewModel>(
        builder:
            (context, model, child) => DefaultTabController(
              length: 2, // People & Groups
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  centerTitle: false,
                  title: Text(
                    'Talenty',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(50),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        isScrollable: false,
                        labelColor: primaryColor,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: primaryColor,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: const [
                          Tab(text: 'Mis Match'),
                          Tab(text: 'Lis intereas'),
                        ],
                      ),
                    ),
                  ),
                ),
                body: Column(
                  children: [
                    15.verticalSpace,
                    // Tab Views
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: TabBarView(
                          children: [Text('first'), Text('second')],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
