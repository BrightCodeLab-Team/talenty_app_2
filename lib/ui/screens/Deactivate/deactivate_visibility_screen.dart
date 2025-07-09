import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/strings.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/Deactivate/deactivate_visibility_view_model.dart';


class DeactivateVisibilityScreen extends StatelessWidget {
  
   @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DeactivateVisibilityViewModel(),
      child: Consumer<DeactivateVisibilityViewModel>(
        builder: (context, vm, child ) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Image.asset(
              "$staticAssets/talenty_logo.png",
              height: 30
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                  style: style14source
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9F9F9),
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'No ser visible',
                          style: style16B,
                        ),
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
                  OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 48),
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Cancelar',
                    style: style16M,
                  ),
                ),
                    const SizedBox(height: 12),
                ElevatedButton(
                  onPressed: () {
                    vm.toggleVisibility();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: vm.isVisible ? Colors.red[100] : Colors.green[100],
                    foregroundColor: vm.isVisible ? Colors.red[800] : Colors.green[800],
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    vm.isVisible ? 'Desactivar visibilidad' : 'Activar visibilidad',
                    style: style16M,
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
