// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/menu_resuse/menu_reuse.dart';
import 'package:talenty_app/ui/screens/common/tips/tips_screen.dart';

import 'package:talenty_app/ui/screens/company/further_menu/menu_view_model.dart';
import 'package:talenty_app/ui/screens/company/notifications/notification_screen.dart';
import 'package:talenty_app/ui/screens/edit_recruiter/edit_recruiter.dart';
import 'package:talenty_app/ui/screens/my_data/my_data_screen.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MenuViewModel(),
      child: Consumer<MenuViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(child: Image.asset(AppAssets.appLogo2, scale: 5)),

                      ///
                      /// Profile
                      ///
                      _profile(),
                      20.verticalSpace,
                      Divider(color: dividerColor, thickness: 1),
                      20.verticalSpace,

                      ///
                      /// Title
                      ///
                      Text('Mi Cuenta', style: style16source),
                      18.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/vector.png',
                          scale: 4.5,
                        ),
                        title: 'Perfil administrativo',
                        onTap: () {
                          Get.to(() => EditRecruiter());
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => EditRecruiter(),
                          //   ),
                          // );
                        },
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/bell.png',
                          scale: 4.5,
                        ),
                        title: 'Notificaciones',
                        onTap: () {
                          Get.to(() => NotificationScreen());
                        },
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/calender.png',
                          scale: 4.5,
                        ),
                        title: 'Mi calendario',
                        onTap: () {},
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/addcontact.png',
                          scale: 4.5,
                        ),
                        title: 'Mis estadísticas',
                        onTap: () {
                          //Get.to(() => MyDataScreen());
                        },
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/tips.png',
                          scale: 4.5,
                        ),
                        title: 'Tips',
                        onTap: () {
                          Get.to(() => TipsScreen());
                        },
                      ),
                      //
                      SizedBox(height: 35),
                      //
                      Text('Privacidad y Seguridad', style: style16source),
                      //
                      18.verticalSpace,
                      //
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/setting.png',
                          scale: 4.5,
                        ),
                        title: 'Configuración de cuenta',
                        onTap: () {},
                      ),

                      //
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/shield.png',
                          scale: 4.5,
                        ),
                        title: 'Aviso de privacidad',
                        onTap: () {},
                      ),
                      20.verticalSpace,
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

_profile() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleAvatar(
        radius: 46.3.r,
        backgroundImage: AssetImage(AppAssets.menulogo),
      ),
      4.horizontalSpace,
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Viajes Premium', style: style24),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Ver Perfil de Empresa', style: style14source),
              //
              SizedBox(width: 5.w),
              //
              Icon(Icons.arrow_forward, color: lightBlackColor, size: 20),
            ],
          ),
        ],
      ),
    ],
  );
}
