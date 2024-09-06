import 'package:cats/core/theme/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Catbreeds',
          style: AppTheme.titleTextStyle,
        ),
        Image.asset('assets/images/cat.png'),
      ],
    );
  }
}
