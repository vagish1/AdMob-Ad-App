import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

class AdListView extends StatelessWidget {
  const AdListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("ad"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              if (index % 3 == 0) {
                return getAd();
              }
              return listItem(index);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 12.0,
              );
            },
            itemCount: 20));
  }

  Widget getAd() {
    BannerAdListener bannerAdListener =
        BannerAdListener(onAdWillDismissScreen: (ad) {
      ad.dispose();
    }, onAdClosed: (ad) {
      debugPrint("Ad Got Closeed");
    });
    BannerAd bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: Platform.isAndroid
          ? "ca-app-pub-3940256099942544/6300978111"
          : "ca-app-pub-3940256099942544/2934735716",
      listener: bannerAdListener,
      request: const AdRequest(),
    );

    bannerAd.load();

    return SizedBox(
      height: 100,
      child: AdWidget(ad: bannerAd),
    );
  }

  Widget listItem(int index) {
    return ListTile(
      title: Text("Item No $index"),
      subtitle: Text("This item is at $index"),
    );
  }
}
