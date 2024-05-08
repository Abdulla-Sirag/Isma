import 'package:flutter/material.dart';

import 'curved_edges.dart';

class IsmaCurvedEdgesWidget extends StatelessWidget {
  const IsmaCurvedEdgesWidget({
    super.key, this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: IsmaCustomCurvedEdges(),
      child: child,
    );
  }
}
