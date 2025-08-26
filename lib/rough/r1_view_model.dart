import 'package:flutter/cupertino.dart';
import 'package:talenty_app/core/others/base_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/candidate_home/candidate_home_screen.dart';
import 'package:talenty_app/ui/screens/candidate/chats/candidate_chat.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';

class R1ViewModel extends BaseViewModel {
  int currentIndex = 0;
  void selectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List<Widget> screens = [
    CandidateHomeScreen(),
    CandidateChatScreen(),
    CandidateMasScreen(),
  ];
}
