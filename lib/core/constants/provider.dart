import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_16_percent/register_16_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_50_percent/register_50_view_model.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_recruiter/register_recruiter_view_model.dart';
import 'package:talenty_app/ui/screens/theme/lang_theme_provider.dart';
import '../../ui/screens/company/onboarding_screen/onboarding_view_model.dart';

List<SingleChildWidget> providerPath = [
  ChangeNotifierProvider(create: (_) => LanThemeProvider()),
  ChangeNotifierProvider(create: (_) => OnBoardingViewModel()),
  ChangeNotifierProvider(create: (_) => Register16ViewModel()),
  ChangeNotifierProvider(create: (_) => Register50ViewModel()),
  ChangeNotifierProvider(create: (_) => RegisterRecruiterViewModel()),
];
