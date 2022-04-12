import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnim extends StatelessWidget {
  const ShimmerAnim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Shimmer Animation"),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getSongList(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data!.elementAt(index)['title']),
                    subtitle: Text(snapshot.data!.elementAt(index)['Artist']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                          snapshot.data!.elementAt(index)['label']),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 8.0,
                  );
                },
                itemCount: snapshot.data!.length);
          }
          return ListView.separated(
            itemBuilder: (context, index) {
              return const ShimmerItem();
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8.0,
              );
            },
            itemCount: 15,
          );
        }),
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getSongList() async {
    await Future.delayed(const Duration(seconds: 12));
    return Future.value(
      [
        {
          "title": "Maan bharya 2.0",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/A10301A0004650970O_20210814110023309/1628932807/srch_sonymusic_A10328E0010075121N.jpg",
          "Artist": "B Praak",
          "songDuration": "3:07",
        },
        {
          "title": "Khushi Jab Bhi Teri (Feat. Khushalii Kumar)",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_hungama/music/8903431824028/1631805930/srch_hungama_72688602.jpg",
          "Artist": "Jubin Nautiyal",
          "songDuration": "4:05",
        },
        {
          "title": "When You're Gone",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/1648702285/srch_universalmusic_00602445741267-USUM72204098.jpg",
          "Artist": "Shawn Mendes",
          "songDuration": "2:52",
        },
        {
          "title": "Stay",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/A10301A0004622804Y_20210706191109211/1625592609/srch_sonymusic_A10328E00100230915.jpg",
          "Artist": "Justin bieber",
          "songDuration": "2:21",
        },
        {
          "title": "Industry baby",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/A10301A0004624020X_20210720192432717/1626802810/srch_sonymusic_A10328E0010025455J.jpg",
          "Artist": "Lil Nas X",
          "songDuration": "3:32",
        },
        {
          "title": "MONTERO (Call Me By Your Name)",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/A10301A0004546070M_20210322210915848/1616444720/srch_sonymusic_A10328E0009881076Q.jpg",
          "Artist": "Lil Nas X",
          "songDuration": "2:17",
        },
        {
          "title": "Heat Waves",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/1631257115/srch_universalmusic_00602438819706-GBUM72101299.jpg",
          "Artist": "Glass Animals",
          "songDuration": "2:55",
        },
        {
          "title": "Hold On",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/1614926427/srch_universalmusic_00602435870106-USUM72102322.jpg",
          "Artist": "Justin bieber",
          "songDuration": "",
        },
        {
          "title": "Butter",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_orchard/music/update/20210714234654_196006720476/1626321914/srch_orchard_196006720476_QM6MZ2156864.jpg",
          "Artist": "BTS",
          "songDuration": "2:45",
        },
        {
          "title": "Pyaar Karte Ho Na",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/1637628717/srch_universalmusic_00602445256150-INUM72100087.jpg",
          "Artist": "Stebin Ben",
          "songDuration": "3:11",
        },
        {
          "title": "Ranjha (From Shershaah)",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_sonymusic/music/A10301A0004645633A_20210804140407209/1628079608/srch_sonymusic_A10328E0010065736U.jpg",
          "Artist": "Anvita dutt",
          "songDuration": "3:48",
        },
        {
          "title": "Arabic Kuthu (From Beast)",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_orchard/music/update/20220223161946_196626458629/1645652419/srch_orchard_196626458629_QM4TW2268780.jpg",
          "Artist": "Anirudh Ravichander",
          "songDuration": "3:55",
        },
        {
          "title": "Harleys In Hawaii",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/1571071623/srch_universalmusic_00602508402289-USUM71919682.jpg",
          "Artist": "Katy Perry",
          "songDuration": "3:05",
        },
        {
          "title": "Love Me Like You Do",
          "label":
              "https://img.wynk.in/unsafe/248x248/filters:no_upscale():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_universalmusic/music/update/1594327964/srch_universalmusic_00602567332756-GBUM71706324.jpg",
          "Artist": "Ellie Goulding",
          "songDuration": "4:13",
        },
      ],
    );
  }
}

class ShimmerItem extends StatelessWidget {
  const ShimmerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(children: [
          const CircleAvatar(
            radius: 28.0,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 75,
                  height: 15,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  width: double.infinity,
                  color: Theme.of(context).scaffoldBackgroundColor,
                  height: 15,
                ),
              ],
            ),
          )
        ]),
      ),
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade100,
    );
  }
}
