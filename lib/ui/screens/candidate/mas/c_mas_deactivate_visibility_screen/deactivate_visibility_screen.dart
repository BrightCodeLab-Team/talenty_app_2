import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/screens/candidate/mas/c_mas_deactivate_visibility_screen/deactivate_visibility_screen_view_model.dart';
import 'package:talenty_app/ui/screens/candidate/mas/main_menu_screen/candidate_mas_screen.dart';

class DeactivateVisibilityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeactivateVisibilityViewModel(),
      child: Consumer<DeactivateVisibilityViewModel>(
        builder:
            (context, vm, child) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: CustomBackButton(),
                ),
                centerTitle: true,
                title: Image.asset(AppAssets.appLogo2, scale: 4),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '¿Qué pasa si desactivas tu visibilidad?',
                      style: style24M,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Al desactivar tu visibilidad, tu perfil dejará de mostrarse como candidato para las empresas.',
                      style: style14source,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      '¿Has encontrado trabajo o simplemente quieres tomarte un descanso?\n'
                      'Puedes desactivar tu visibilidad para dejar de aparecer en los perfiles de vacantes de las empresas, sin necesidad de eliminar tu cuenta.\n\n'
                      'Ninguna empresa podrá ver tu perfil, hacer match contigo, ni comunicarse contigo, a menos que ya hayan coincidido previamente.\n'
                      'Esta opción es ideal si ya encontraste trabajo y no deseas recibir más ofertas laborales sin necesidad de eliminar tu cuenta.',
                      style: style14sourceblack,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        'Recuerda:',
                        style: style16B.copyWith(color: Colors.red),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFF9F9F9).withOpacity(0.1),
                        border: Border.all(
                          color: Colors.grey.shade300.withOpacity(0.1),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text('No ser visible', style: style16B),
                          ),
                          const Text('='),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'No recibir oportunidades laborales.',
                              style: style16B,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    CustomButton(
                      text: 'Cancelar',
                      onTap: () {
                        Get.to(CandidateMasScreen());
                      },
                      textColor: blackColor,
                      backgroundColor: whiteColor,
                      borderColor: blackColor,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      text:
                          vm.isVisible
                              ? 'Desactivar visibilidad'
                              : 'Activar visibilidad',
                      onTap: () {
                        vm.toggleVisibility();
                      },
                      backgroundColor:
                          vm.isVisible ? Colors.red[100] : Colors.green[100],

                      textColor: vm.isVisible ? primaryColor : darkgreenColor,
                      borderColor: vm.isVisible ? primaryColor : darkgreenColor,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}
