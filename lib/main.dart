import 'package:flutter/material.dart';
import 'package:google_ad_integration/demo_scr.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'dart:io' show Platform;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AdRequest? adRequest;
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  RewardedAd? rewardedAd;

  @override
  void initState() {
    super.initState();

    String bannerId = Platform.isAndroid
        ? "ca-app-pub-3940256099942544/6300978111"
        : "ca-app-pub-3940256099942544/2934735716";

    adRequest = const AdRequest(
      nonPersonalizedAds: false,
    );

    BannerAdListener bannerAdListener = BannerAdListener(
      onAdClosed: (ad) {
        bannerAd!.load();
      },
      onAdFailedToLoad: (ad, error) {
        bannerAd!.load();
      },
    );
    bannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: bannerId,
      listener: bannerAdListener,
      request: adRequest!,
    );

    bannerAd!.load();
  }

  @override
  void dispose() {
    bannerAd!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AdMob"),
      ),
      body: Column(
        children: [
          SizedBox(
            child: AdWidget(ad: bannerAd!),
            height: 100,
          ),
          ElevatedButton(
              onPressed: () {
                InterstitialAd.load(
                  adUnitId: Platform.isAndroid
                      ? "ca-app-pub-3940256099942544/1033173712"
                      : "ca-app-pub-3940256099942544/4411468910",
                  request: const AdRequest(),
                  adLoadCallback: InterstitialAdLoadCallback(
                    onAdLoaded: (ad) {
                      interstitialAd = ad;
                      ad.show();

                      interstitialAd?.fullScreenContentCallback =
                          FullScreenContentCallback(
                              onAdDismissedFullScreenContent: (ad) {
                        interstitialAd?.dispose();
                        ad.dispose();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Demo(),
                          ),
                        );
                      }, onAdFailedToShowFullScreenContent: (ad, err) {
                        ad.dispose();
                        interstitialAd?.dispose();
                      });
                    },
                    onAdFailedToLoad: (err) {
                      interstitialAd?.dispose();
                    },
                  ),
                );
              },
              child: const Text("Show Interestital Ad")),
          ElevatedButton(
            onPressed: () {
              RewardedAd.load(
                adUnitId: Platform.isAndroid
                    ? "ca-app-pub-3940256099942544/5224354917"
                    : "ca-app-pub-3940256099942544/6978759866",
                request: const AdRequest(),
                rewardedAdLoadCallback: RewardedAdLoadCallback(
                  onAdLoaded: (ad) {
                    rewardedAd = ad;
                    rewardedAd?.show(
                      onUserEarnedReward: ((ad, reward) {
                        debugPrint("My Reward Amount -> ${reward.amount}");
                      }),
                    );

                    rewardedAd?.fullScreenContentCallback =
                        FullScreenContentCallback(
                            onAdFailedToShowFullScreenContent: (ad, err) {
                      ad.dispose();
                    }, onAdDismissedFullScreenContent: (ad) {
                      ad.dispose();
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return Demo();
                      }));
                    });
                  },
                  onAdFailedToLoad: (err) {
                    debugPrint(err.message);
                  },
                ),
              );
            },
            child: const Text(
              "Load Reward Ad",
            ),
          ),
        ],
      ),
    );
  }
}
