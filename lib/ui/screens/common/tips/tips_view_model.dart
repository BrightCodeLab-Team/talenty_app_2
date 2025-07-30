import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/model/company/tips.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class TipsViewModel extends BaseViewModel {
  final List<TipModel> tipsList1 = [
    TipModel(
      id: '1',
      title: 'Prepárate para la entrevista',
      description: 'Investiga acerca de la empresa antes de hablar con ellos.',
      imageUrl: AppAssets.tipsImg,
    ),
    TipModel(
      id: '2',
      title: 'Investiga la empresa',
      description: 'Conoce los productos y cultura empresarial.',
      imageUrl: AppAssets.tipsImg,
    ),
  ];
  // second list of tips

  final List<TipModel> tipsList2 = [
    TipModel(
      id: '1',
      title: 'Prepara una pregunta',
      description: 'Demuesta interés preguntando sobre la empresa.',
      imageUrl: AppAssets.tipsImg,
    ),
    TipModel(
      id: '2',
      title: 'Visita Apropaidamenta',
      description: 'Usa ropa formal a profesional segun el rol .',
      imageUrl: AppAssets.tipsImg,
    ),
  ];
  // third list of tips
  final List<TipModel> tipsList3 = [
    TipModel(
      id: '1',
      title: 'La importancia de un CV',
      description:
          'Elige undiseno simple y facil de leer ,ademas, es importante anadir tus datos actualizados .',
      imageUrl: AppAssets.tipsImg,
    ),
    TipModel(
      id: '2',
      title: 'Detalla tus habilidades',
      description:
          'Usa palabras clave como "Organizado" o "proactivo". Muestra que eres unica!.',
      imageUrl: AppAssets.tipsImg,
    ),
  ];
}
