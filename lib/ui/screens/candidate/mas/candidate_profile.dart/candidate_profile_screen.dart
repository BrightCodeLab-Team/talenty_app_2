import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/menu_resuse/menu_reuse.dart';
import 'package:talenty_app/ui/screens/candidate/home/candidate_home_view_model.dart';

class CandidateProfileScreen extends StatelessWidget {
  const CandidateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CandidateHomeViewModel(),
      child: Consumer(
        builder:
            (context, model, child) => Scaffold(
              appBar: AppBar(backgroundColor: transparent),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.verticalSpace,
                      _profile(),
                      20.verticalSpace,

                      Text('Mi CV', style: style16source),
                      18.verticalSpace,
                      MenuReuse(
                        leading: Icon(Icons.photo),
                        title: 'Mis fotografías',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          "$iconsAssets/vector.png",
                          scale: 4,
                        ),
                        title: 'Datos Personales',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp3, scale: 4),
                        title: 'Estudios',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp4, scale: 4),
                        title: 'Experiencia Laboral',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp5, scale: 4),
                        title: 'Habilidades',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp6, scale: 4),
                        title: 'Talentos',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp7, scale: 4),
                        title: 'Hobbies',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(AppAssets.cp8, scale: 4),
                        title: 'Idiomas',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Icon(
                          Icons.workspace_premium_rounded,
                          color: textDarkGreyColor,
                        ),
                        title: 'Certificaciones y Curosos',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
                      MenuReuse(
                        leading: Image.asset(
                          AppAssets.candidatoIcon,
                          scale: 4,
                          color: textDarkGreyColor,
                        ),
                        title: 'Sobre mí',
                        onTap: () {},
                        child: AnimatedContainer(duration: Duration()),
                      ),
                      10.verticalSpace,
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
      CircleAvatar(radius: 40.r, backgroundImage: AssetImage(AppAssets.img2)),
      4.horizontalSpace,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('Jorge Pérez', style: style24), 4.verticalSpace],
      ),
      Spacer(),
      Image.asset(AppAssets.badgeIcon, scale: 4),
    ],
  );
}
