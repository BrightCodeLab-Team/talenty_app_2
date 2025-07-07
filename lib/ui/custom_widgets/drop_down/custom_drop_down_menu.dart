import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:talenty_app/core/constants/colors.dart';
import 'package:talenty_app/core/constants/text_style.dart';
import 'package:talenty_app/ui/screens/company/build_profile/register_company/register_50_percent/register_50_view_model.dart';

class DropDownMenu extends StatefulWidget {
  const DropDownMenu({
    super.key,
    required this.isDroppedDown,
    this.height,
    required this.options,
    this.onItemTap,
  });
  final bool isDroppedDown;
  final double? height;
  final List<String> options;
  final Function(String)? onItemTap;

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Register50ViewModel>(
      builder: (context, model, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color:
                  widget.isDroppedDown ? lightBlackColor : Colors.transparent,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          height: widget.isDroppedDown ? widget.height : 0,
          child: RawScrollbar(
            controller: _scrollController,
            thumbColor: lightBlackColor, // match your design
            radius: Radius.circular(4.r),
            thickness: 4,
            crossAxisMargin: 4,

            // optionally make it always visible:
            thumbVisibility: true,
            child: ListView.builder(
              padding: EdgeInsets.zero, // 🚫 removes default ListView padding
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: widget.options.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => widget.onItemTap?.call(widget.options[index]),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 8, bottom: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            widget.options[index],
                            style: style14M.copyWith(color: lightBlackColor),
                          ),
                        ),
                      ),
                      Divider(color: borderGreyColor),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
