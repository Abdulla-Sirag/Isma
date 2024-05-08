import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';


class IsmaPrimaryHeaderContainer extends StatelessWidget {
  const IsmaPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return IsmaCurvedEdgesWidget(
      child: Container(
        color: IsmaColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 350,

          /// If [size.infinite': is not true. in stack] error occurred -> Read README.md file at ...
          child: Stack(
            children: [
              /// -- Background Custom Shapes
              Positioned(top: -150, right: -250, child: IsmaCircularContainer(backgroundColor: IsmaColors.textWhite.withOpacity(0.1),)),
              Positioned(top: 100, right: -300, child: IsmaCircularContainer(backgroundColor: IsmaColors.textWhite.withOpacity(0.1),)),
              child,
            ],
          ),
        ),
      ),
    );
  }
}

