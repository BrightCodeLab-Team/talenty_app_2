// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/app_assets.dart';
import 'package:talenty_app/core/constants/auth_field_decoration.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/core/model/company/recruite.dart';

import 'package:talenty_app/ui/screens/company/recruiter/recruiter_view_model.dart';

class RecruiterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RecruiterViewModel(),
      child: Consumer<RecruiterViewModel>(
        builder:
            (context, model, child) => Scaffold(
              ///
              /// Start Body
              ///
              body: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(AppAssets.appLogo2, scale: 6)),
                    30.verticalSpace,
                    Text("My Recruiters".tr, style: style24M),
                    16.verticalSpace,
                    Text(
                      'recruiters_information'.tr,
                      style: style16M,
                    ),
                    10.verticalSpace,

                    TextFormField(
                      decoration: authFieldDecoration.copyWith(
                        hintText:'Looking for a recruiter'.tr,
                        prefixIcon: Icon(Icons.search, color: lightBlackColor),
                      ),
                      onChanged: (value) {
                        context.read<RecruiterViewModel>().searchRecruiter(
                          value,
                        );
                      },
                    ),

                    10.verticalSpace,

                    ///
                    /// Crear Button
                    ///
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: model.isSearching ? SizedBox() : _button(),
                    ),

                    ///
                    /// List Data
                    ///
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: model.recruiters.length,
                        itemBuilder: (context, index) {
                          final recruiter = model.recruiters[index];
                          return _recruiterCard(recruiter);
                        },
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

_button() {
  return Center(
    child: Container(
      margin: EdgeInsets.all(10),
      width: 211,
      height: 54,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: lightBlackColor),
        color: secondaryColor,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Image.asset(
            AppAssets.userAddIcon,
            height: 24,
            width: 24,
            color: lightBlackColor,
          ),
          5.horizontalSpace,
          Text(
          "Create_recruiter".tr,
            style: style16M.copyWith(color: lightBlackColor),
          ),
        ],
      ),
    ),
  );
}

Widget _buildTag(TagModel tag) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    decoration: BoxDecoration(
      color: tag.color.withOpacity(0.2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      "${tag.label}: ${tag.count}",
      style: style12M.copyWith(fontWeight: FontWeight.w600, color: tag.color),
    ),
  );
}

Widget _recruiterCard(RecruiterModel recruiter) {
  return Container(
    margin: EdgeInsets.only(bottom: 16),
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: blackColor.withOpacity(0.10),
          blurRadius: 8,
          offset: Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///
        /// Top Row
        ///
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: AssetImage(recruiter.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                5.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recruiter.name,
                      style: style16B.copyWith(color: lightBlackColor),
                    ),
                    Text(
                      recruiter.role,
                      style: style14M.copyWith(
                        fontWeight: FontWeight.w400,
                        color: textGreyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: lightBlackColor),
            ),
          ],
        ),
        10.verticalSpace,

        ///
        /// Description
        ///
        Text(
          recruiter.description,
          style: style14M,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        10.verticalSpace,

        ///
        /// Date
        ///
        Row(
          children: [
            Image.asset(AppAssets.calendar, scale: 4),
            2.horizontalSpace,
            Text(
              "Fecha de creación el ${recruiter.createdDate}",
              style: style14M,
            ),
          ],
        ),
        10.verticalSpace,
        Divider(color: dividerColor, thickness: 1),
        10.verticalSpace,

        ///
        /// Tags Section
        ///
        Center(child: Text( "Status_of_Vacancies".tr, style: style14M)),
        10.verticalSpace,
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: recruiter.tags.map((tag) => _buildTag(tag)).toList(),
        ),
      ],
    ),
  );
}
