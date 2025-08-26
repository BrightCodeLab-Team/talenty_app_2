import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/rough/r1_view_model.dart';

class RoughScreen extends StatelessWidget {
  const RoughScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => R1ViewModel(),
      child: Consumer<R1ViewModel>(
        builder:
            (context, model, child) => Scaffold(
              bottomNavigationBar: SizedBox(
                height: 60.h,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        model.selectedIndex(0);
                      },
                      icon: Icon(Icons.home, size: 25),
                    ),
                    IconButton(
                      onPressed: () {
                        model.selectedIndex(1);
                      },
                      icon: Icon(Icons.chat, size: 25),
                    ),
                    IconButton(
                      onPressed: () {
                        print('person');
                        model.selectedIndex(2);
                      },
                      icon: Icon(Icons.person, size: 25),
                    ),
                  ],
                ),
              ),
              body: model.screens[model.currentIndex],
            ),
      ),
    );
  }
}
/*


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Import your page classes
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_screen.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';
import 'package:talenty_app/ui/screens/candidate/mas/mas_calendar_screen/calendar_screen.dart';

class RoughScreen extends StatefulWidget {
  const RoughScreen({super.key});

  @override
  State<RoughScreen> createState() => _RoughScreenState();
}

class _RoughScreenState extends State<RoughScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const CandidateHomeScreen(),
    const CandidateChatScreen(),
    const CandidateMasCalendarScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 60.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: Icon(
                Icons.home,
                size: 25,
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: Icon(
                Icons.chat,
                size: 25,
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(2),
              icon: Icon(
                Icons.person,
                size: 25,
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/