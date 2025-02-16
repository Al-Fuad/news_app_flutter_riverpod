import 'package:flutter/material.dart';

/// A custom loading widget that displays a circular progress indicator.
class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Displays a circular progress indicator
        CircularProgressIndicator(),
      ],
    );
  }
}
