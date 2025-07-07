import 'package:talenty_app/core/model/company/tips.dart';
import 'package:talenty_app/core/others/base_view_model.dart';

class TipsViewModel extends BaseViewModel {
  final List<TipModel> tipsList = [
    TipModel(
      id: '1',
      title: 'Prepárate para la entrevista',
      description: 'Investiga acerca de la empresa antes de hablar con ellos.',
      imageUrl: 'assets/dynamic_assets/office.png',
    ),
    TipModel(
      id: '2',
      title: 'Investiga la empresa',
      description: 'Conoce los productos y cultura empresarial.',
      imageUrl: 'assets/dynamic_assets/employes.jpg',
    ),
  ];
}
