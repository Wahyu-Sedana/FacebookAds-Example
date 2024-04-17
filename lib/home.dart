import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:flutter/material.dart';

import 'button_widget.dart';
import 'helper.dart';

Helper helper = Helper();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ad Network List"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('interstitial Ad'),
            AdButton(
              networkName: 'Facebook Interstitial',
              onTap: () => helper.showAd(context, AdNetwork.facebook, AdUnitType.interstitial),
            ),
          ],
        ),
      ),
    );
  }
}
