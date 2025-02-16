import 'package:flutter/material.dart';

/// A custom widget to display error messages.
class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        // Display the error message
        Text("Error"),
      ],
    );
  }
}
