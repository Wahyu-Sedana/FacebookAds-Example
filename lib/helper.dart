import 'dart:async';

import 'package:easy_ads_flutter/easy_ads_flutter.dart';
import 'package:facebook_ads/country.dart';
import 'package:flutter/material.dart';

StreamSubscription? _streamSubscription;

class Helper {
  void showAd(BuildContext context, AdNetwork adNetwork, AdUnitType adUnitType) {
    if (EasyAds.instance.showAd(
      adUnitType,
      adNetwork: adNetwork,
      context: context,
    )) {
      _streamSubscription?.cancel();
      _streamSubscription = EasyAds.instance.onEvent.listen((event) {
        if (event.adUnitType == adUnitType) {
          _streamSubscription?.cancel();
          goToNextScreen(context, adNetwork: adNetwork);
        }
      });
    } else {
      goToNextScreen(context, adNetwork: adNetwork);
    }
  }

  void showAvailableAd(BuildContext context, AdUnitType adUnitType) {
    if (EasyAds.instance.showAd(adUnitType)) {
      _streamSubscription?.cancel();
      _streamSubscription = EasyAds.instance.onEvent.listen((event) {
        if (event.adUnitType == adUnitType) {
          _streamSubscription?.cancel();
          goToNextScreen(context);
        }
      });
    } else {
      goToNextScreen(context);
    }
  }

  void goToNextScreen(BuildContext context, {AdNetwork? adNetwork}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CountryDetailScreen(adNetwork: adNetwork),
      ),
    );
  }
}
