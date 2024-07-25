import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/extension.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.semiBold(
                  StringResMain.educationTitle.tr(),
                ),
              ],
            ),
          ).marginSymmetric(vertical: 34, horizontal: 18),
        ],
      ),
    );
  }
}
