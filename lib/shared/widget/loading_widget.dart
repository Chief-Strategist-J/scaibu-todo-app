import 'package:flutter/material.dart';

/// Loading widget
class LoadingWidget extends StatelessWidget {
  /// Loading widget
  const LoadingWidget({super.key});

  @override
  Widget build(final BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}
