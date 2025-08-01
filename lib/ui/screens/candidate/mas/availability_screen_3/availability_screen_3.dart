import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';
import 'package:talenty_app/ui/custom_widgets/divider.dart';

class AvailabilityScreenThree extends StatefulWidget {
  const AvailabilityScreenThree({super.key});

  @override
  State<AvailabilityScreenThree> createState() =>
      _AvailabilityScreenThreeState();
}

class _AvailabilityScreenThreeState extends State<AvailabilityScreenThree> {
  bool _agregaHorariosChecked = false;
  bool _empresasAgendarChecked = false;
  bool _recibeConfirmacionesChecked = false;
  bool _editaDisponibilidadChecked = false;

  bool get _areAllCheckboxesSelected =>
      _agregaHorariosChecked &&
      _empresasAgendarChecked &&
      _recibeConfirmacionesChecked &&
      _editaDisponibilidadChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        foregroundColor: transparent,
        leading: CustomBackButton(),
        title: Text(
          'Mi disponibilidad',
          style: style24M.copyWith(fontSize: 20),
        ),
        centerTitle: false,
        backgroundColor: transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '                                                                                       Gestiona tus horarios y conecta con empresas sin complicaciones.',
              style: style20B.copyWith(color: blackColor),
            ),
            20.verticalSpace,
            Center(
              child: Image.asset(
                AppAssets.availabilityScreenThreeImage,
                scale: 4,
              ),
            ),
            20.verticalSpace,
            Text(
              '¿Cómo funciona?'.tr,
              style: style20B.copyWith(color: darkPurpleColor),
            ),
            10.verticalSpace,
            _buildCheckboxRow(
              'Agrega los horarios en los que estás disponible.'.tr,
              _agregaHorariosChecked,
              (bool? newValue) {
                setState(() {
                  _agregaHorariosChecked = newValue ?? false;
                });
              },
            ),
            _buildCheckboxRow(
              'Las empresas pueden agendar videollamadas contigo directamente.'
                  .tr,
              _empresasAgendarChecked,
              (bool? newValue) {
                setState(() {
                  _empresasAgendarChecked = newValue ?? false;
                });
              },
            ),
            _buildCheckboxRow(
              'Recibe confirmaciones y mantén todo organizado en un solo lugar.'
                  .tr,
              _recibeConfirmacionesChecked,
              (bool? newValue) {
                setState(() {
                  _recibeConfirmacionesChecked = newValue ?? false;
                });
              },
            ),
            _buildCheckboxRow(
              'Edita tu disponibilidad cuando lo necesites.'.tr,
              _editaDisponibilidadChecked,
              (bool? newValue) {
                setState(() {
                  _editaDisponibilidadChecked = newValue ?? false;
                });
              },
            ),
            40.verticalSpace,
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 40),
        child: CustomButton(
          text: 'Configurar mi disponibilidad',
          onTap:
              _areAllCheckboxesSelected
                  ? () {
                    print('Configuring availability...');
                  }
                  : null,
          backgroundColor: _areAllCheckboxesSelected ? brownColor : greyColor,
          textColor: _areAllCheckboxesSelected ? whiteColor : whiteColor,
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(
    String text,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Transform.scale(
          scale: 1,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: darkgreenColor,
            checkColor: whiteColor,
            side: BorderSide(
              color: value ? darkgreenColor : blackColor,
              width: 1,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        Expanded(
          child: Text(text, style: style14M.copyWith(color: blackColor)),
        ),
      ],
    );
  }
}
