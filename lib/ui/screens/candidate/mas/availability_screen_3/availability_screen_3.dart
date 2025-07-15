import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/custom_widgets/back_button.dart';
import 'package:talenty_app/ui/custom_widgets/buttons/custom_buttons.dart';

class AvailabilityScreenThree extends StatefulWidget {
  const AvailabilityScreenThree({super.key});

  @override
  State<AvailabilityScreenThree> createState() =>
      _AvailabilityScreenThreeState();
}

class _AvailabilityScreenThreeState extends State<AvailabilityScreenThree> {
  // State variables for each checkbox
  bool _agregaHorariosChecked = false;
  bool _empresasAgendarChecked = false;
  bool _recibeConfirmacionesChecked = false;
  bool _editaDisponibilidadChecked = false;

  // Helper to check if all checkboxes are selected
  bool get _areAllCheckboxesSelected =>
      _agregaHorariosChecked &&
      _empresasAgendarChecked &&
      _recibeConfirmacionesChecked &&
      _editaDisponibilidadChecked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CustomBackButton(),
        ),
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
            20.verticalSpace,
            Text(
              'Gestiona tus horarios y conecta con empresas sin complicaciones.',
              style: style20B.copyWith(
                color: blackColor,
              ), // Adjust as per your design
            ),
            20.verticalSpace,
            Center(
              child: Image.asset(
                AppAssets.AvailabilityScreenThreeImage,
                scale: 4,
              ),
            ),
            20.verticalSpace,
            Text(
              '¿Cómo funciona?'.tr,
              style: style20B.copyWith(
                color: blackColor,
              ), // Adjust as per your design
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
        padding: EdgeInsets.all(10.w),
        child: CustomButton(
          text: 'Configurar mi disponibilidad',
          onTap:
              _areAllCheckboxesSelected
                  ? () {
                    // Handle button tap when all checkboxes are selected
                    print('Configuring availability...');
                  }
                  : null, // Disable button if not all selected
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Transform.scale(
            scale: 1,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: darkgreenColor, // Green background when checked
              checkColor: whiteColor, // White checkmark color
              side: BorderSide(
                color:
                    value
                        ? darkgreenColor
                        : greyColor, // Border color based on state
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  4,
                ), // Slightly rounded corners for the checkbox
              ),
            ),
          ),

          Expanded(
            child: Text(
              text,
              style: style14M.copyWith(
                color: blackColor, // Adjust text color as needed
              ),
            ),
          ),
        ],
      ),
    );
  }
}
