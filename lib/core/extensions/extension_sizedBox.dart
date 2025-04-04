import 'package:cryptocurrency/core/extensions/extension_MediaQuary.dart';
import 'package:flutter/material.dart';

extension SizedBoxExtension on num {
  Widget get hSizedBox => SizedBox(height: toDouble());
  Widget get wSizedBox => SizedBox(width: toDouble());
  // here sizedbox responsive is used to make the code more readable and maintainable.
  // it is used to create a sizedbox with a height or width of the given number.                      
  Widget hSizedBoxResponsive(BuildContext context) => SizedBox(height: toDouble() * context.mediaQuery.height / toDouble());
}