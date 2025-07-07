// ignore_for_file: must_be_immutable, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talenty_app/core/constants/colors.dart';

enum KlTextInputFieldStyle {
  email,
  password,
  phoneNumber,
  firstName,
  userName,
  dropDown,
  select,
  address,
  city,
  zipCode,
  cvv,
  search,
  diseaseDescription,
  remedies,
  weather,
  fieldIconLocation,
  diseaseName,
}

class KlTextInputField extends StatefulWidget {
  final KlTextInputFieldStyle style;
  final String? hintText;
  final TextInputType? keyBoardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final void Function()? suffixOntap;
  final TextEditingController? controller;
  final bool readOnly;
  final String? initialValue;
  final bool showCursor;
  final void Function()? ontap;
  final Color? hintTextColor;
  final TextStyle? hintTextStyle;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? focusedBorderColor;
  final Color? enableBorderColor;
  final double? borderRadius;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  void Function()? fetchLocation;

  KlTextInputField({
    Key? key,
    this.fetchLocation,
    this.style = KlTextInputFieldStyle.email,
    this.hintText,
    this.padding,
    this.keyBoardType,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.suffixOntap,
    this.controller,
    this.readOnly = false,
    this.showCursor = true,
    this.initialValue,
    this.ontap,
    this.hintTextColor,
    this.hintTextStyle,
    this.textStyle,
    this.fillColor,
    this.focusedBorderColor,
    this.enableBorderColor,
    this.borderRadius,
    this.onChanged,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.contentPadding,
  }) : super(key: key);

  @override
  _KlTextInputFieldState createState() => _KlTextInputFieldState();
}

class _KlTextInputFieldState extends State<KlTextInputField> {
  bool _isHidden = true;

  TextInputType get keyboardType {
    switch (widget.style) {
      case KlTextInputFieldStyle.email:
        return TextInputType.emailAddress;
      case KlTextInputFieldStyle.password:
        return TextInputType.visiblePassword;
      case KlTextInputFieldStyle.phoneNumber:
        return TextInputType.phone;
      default:
        return widget.keyBoardType ?? TextInputType.text;
    }
  }

  Widget? get suffixIcon {
    if (widget.style == KlTextInputFieldStyle.password) {
      return InkWell(
        onTap: () {
          setState(() {
            _isHidden = !_isHidden;
          });
        },
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 300),
          transitionBuilder: (child, animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child:
              _isHidden
                  ? Icon(
                    Icons.visibility_off,
                    key: ValueKey('visibility_off'),
                    color: Color(0xff707070),
                    size: 20.sp,
                  )
                  : Icon(
                    Icons.visibility,
                    key: ValueKey('visibility'),
                    color: Color(0xff707070),
                    size: 20.sp,
                  ),
        ),
      );
    } else if (widget.style == KlTextInputFieldStyle.fieldIconLocation) {
      return InkWell(
        onTap: widget.fetchLocation,
        child: Icon(Icons.location_on, color: primaryColor, size: 24.sp),
      );
    }
    return widget.suffixIcon;
  }

  // Future<void> fetchLocation() async {
  //   print('Clicked');
  //   // Simulated fetching of location (Replace with actual location service)
  //   await Future.delayed(Duration(seconds: 2));
  //   String mockLocation = "Latitude: 24.8607, Longitude: 67.0011"; // Example location

  //   if (widget.controller != null) {
  //     setState(() {
  //       widget.controller!.text = mockLocation;
  //       print('$mockLocation -------------------------');
  //     });
  //   }
  // }

  String get hintText {
    switch (widget.style) {
      case KlTextInputFieldStyle.email:
        return widget.hintText ?? "enterEmail";
      case KlTextInputFieldStyle.password:
        return widget.hintText ?? "password";
      case KlTextInputFieldStyle.phoneNumber:
        return widget.hintText ?? "enterPhone";
      case KlTextInputFieldStyle.firstName:
        return widget.hintText ?? "enterName";
      case KlTextInputFieldStyle.userName:
        return widget.hintText ?? "enterUsername";
      case KlTextInputFieldStyle.dropDown:
        return widget.hintText ?? "selectDate";
      case KlTextInputFieldStyle.select:
        return widget.hintText ?? "selectOption";

      case KlTextInputFieldStyle.search:
        return widget.hintText ?? "search";

      case KlTextInputFieldStyle.diseaseDescription:
        return widget.hintText ?? "enterdiseaseDescription";

      case KlTextInputFieldStyle.diseaseName:
        return widget.hintText ?? "enterDiseaseName";

      case KlTextInputFieldStyle.remedies:
        return widget.hintText ?? "enterreamedies";

      case KlTextInputFieldStyle.weather:
        return widget.hintText ?? "enterWeather";
      case KlTextInputFieldStyle.fieldIconLocation:
        return widget.hintText ?? "enterLocation";

      default:
        return widget.hintText ?? "enterText";
    }
  }

  bool get isObscure {
    if (widget.style == KlTextInputFieldStyle.password) return _isHidden;
    return widget.obscureText;
  }

  InputDecoration get inputDecoration => InputDecoration(
    filled: true,
    fillColor: widget.fillColor ?? Colors.white,
    hintText: hintText,
    hintStyle:
        widget.hintTextStyle ??
        TextStyle(color: widget.hintTextColor ?? Colors.grey),
    prefixIcon: widget.prefixIcon,
    suffixIcon: suffixIcon,
    contentPadding:
        widget.contentPadding ??
        EdgeInsets.symmetric(horizontal: 12, vertical: 14),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        widget.borderRadius ?? 10.r,
      ), // Rounded corners
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
      borderSide: BorderSide(color: Colors.grey.shade600, width: 1.2),
    ),
    disabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!),
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10.r),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: 40.w),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: keyboardType,
        obscureText: isObscure,
        readOnly:
            widget.style == KlTextInputFieldStyle.fieldIconLocation ||
            widget.readOnly,
        showCursor: widget.showCursor,
        initialValue: widget.initialValue,
        onTap: widget.ontap,
        onChanged: widget.onChanged,
        validator: widget.validator,
        controller: widget.controller,
        textInputAction: widget.textInputAction ?? TextInputAction.next,
        onFieldSubmitted: widget.onFieldSubmitted,
        focusNode: widget.focusNode,
        cursorColor: Color(0xff707070),
        decoration: inputDecoration,
      ),
    );
  }
}
