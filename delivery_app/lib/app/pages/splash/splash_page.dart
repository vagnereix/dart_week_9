import 'package:delivery_app/app/core/config/env/env.dart';
import 'package:delivery_app/app/core/ui/theme/theme_config.dart';
import 'package:delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeConfig.theme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Splash Page'),
        ),
        body: Column(
          children: [
            DeliveryButton(
              label: Env.i['BASE_URL'] ?? '',
              onPressed: () {},
              width: 300,
              height: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                decoration: const InputDecoration(
                  label: Text('Text Form Field'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
