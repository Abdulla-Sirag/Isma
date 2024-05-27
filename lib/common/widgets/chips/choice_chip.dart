import 'package:flutter/material.dart';
import 'package:isma/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:isma/utils/helpers/helper_functions.dart';
import '../../../utils/constants/colors.dart';

class IsmaChoiceChip extends StatelessWidget {
  const IsmaChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {

    final isColor = IsmaHelperFunctions.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? IsmaColors.white : null),
        avatar: isColor
            ? IsmaCircularContainer(width: 50, height: 50, backgroundColor: IsmaHelperFunctions.getColor(text)!,)
        : null,
        shape: isColor
            ? const CircleBorder()
            : null,
        labelPadding: isColor
            ? const EdgeInsets.all(0)
            : null,
        padding: isColor
            ? const EdgeInsets.all(0)
            : null,
        backgroundColor: isColor
            ? IsmaHelperFunctions.getColor(text)!
            : null,
      ),
    );
  }
}
