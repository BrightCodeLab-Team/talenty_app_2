import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/menu_resuse/menu_reuse.dart';
import 'package:talenty_app/ui/screens/Deactivate/deactivate_visibility_screen.dart';
import 'package:talenty_app/ui/screens/calender/calendar_screen.dart';
import 'package:talenty_app/ui/screens/company/further_menu/menu_view_model.dart';

class CandidateMasScreen extends StatefulWidget {
  const CandidateMasScreen({super.key});

  @override
  State<CandidateMasScreen> createState() => _CandidateMasScreenState();
}

class _CandidateMasScreenState extends State<CandidateMasScreen> {
  bool isDisponible = false; 
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
                      Center(child: Container(height: 50, color: whiteColor)),

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
                      ///
                      30.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/tie person.png',
                          scale: 4.5,
                        ),
                        title: 'Visibilidad para las empresas',
                        onTap: () {
                          Get.to(() => DeactivateVisibilityScreen());
                        }, child: AnimatedContainer(duration: Duration()),
                      ),
                      Text(
                        'Tu perfil está oculto actualmente.\nActívalo cuando estés listo para buscar nuevas oportunidades.',
                        style: style14source.copyWith(
                          color: Colors.grey.shade700,
                        ),
                      ),
                      30.verticalSpace,
                      Text('Mi Cuenta', style: style16source),
                      18.verticalSpace,
           MenuReuse(
          leading: Image.asset(
           '$iconsAssets/vector.png',
           scale: 4.5,
       ),
        title: 'Disponibilidad Inmediata',
         trailing: Container(
         constraints: const BoxConstraints(minWidth: 140), 
          child: InkWell(
           borderRadius: BorderRadius.circular(20),
             onTap: () {
              setState(() {
            isDisponible = !isDisponible;
               });
               },
               child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isDisponible ? const Color(0xFFDDF5E4) : const Color(0xFFFAD7D7),
              borderRadius: BorderRadius.circular(20),
              ),
               child: Row(
                mainAxisSize: MainAxisSize.min,
                 children: [
                    Icon(
                    isDisponible ?
                     Icons.camera_alt : Icons.camera_outdoor,
                    color: isDisponible ? Colors.green[700] : Colors.red[700],
                    size: 18,
                  ),
                  const SizedBox(width: 6),
                   Text(
                 isDisponible ? 'Disponible' : 'No disponible',
                 style: TextStyle(
              color: isDisponible ? Colors.green[800] : Colors.red[800],
              fontWeight: FontWeight.w600,
              fontSize: 13,
                     ),
                     ),
                     ],
                    ),
                    ),
                   ),
                  ),),
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/calender.png',
                          scale: 4.5,
                        ),
                        title: 'Mi calendario',
                        onTap: () {
                          Get.to(() => CalendarScreen ());
                        },         child: AnimatedContainer(duration: Duration()),
                      ),

                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/clock.png',
                          scale: 4.5,
                        ),
                        title: 'Mi disponibilidad',
                        onTap: () {},         child: AnimatedContainer(duration: Duration()),
                      ),

                      SizedBox(height: 20),
                      //
                      Text('Privacidad y Seguridad', style: style16source),
                      //
                      18.verticalSpace,
                      //
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/cell.png',
                          scale: 4.5,
                        ),
                        title: 'Empresas bloqueadas',
                        onTap: () {},        child: AnimatedContainer(duration: Duration()),
                      ),

                      //
                      MenuReuse(
                        leading: Image.asset(
                          '$iconsAssets/shield.png',
                          scale: 4.5,
                        ),
                        title: 'Aviso de privacidad',
                        onTap: () {},         child: AnimatedContainer(duration: Duration()),
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
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    CircleAvatar(
      radius: 70.3.r,
      backgroundImage: AssetImage("assets/dynamic_assets/man.png"),
    ),
    8.horizontalSpace, 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Jorge Pérez', style: style24),
        4.verticalSpace,
        Row(
          children: [
            Text('Ver Perfil', style: style14source),
            SizedBox(width: 4.w),
            Icon(Icons.arrow_forward, color: lightBlackColor, size: 14),
            
          ],
        ),
      ],
    ),
    Spacer(), 
    Image.asset(AppAssets.badgeIcon, scale: 4),
  ],
);
}

