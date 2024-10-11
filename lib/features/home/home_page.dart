import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:taaza_khabar/features/auth/auth_provider.dart';
import 'package:taaza_khabar/features/home/remote_config.dart';
import 'package:taaza_khabar/features/home/widgets/fetch_news.dart';
import 'package:taaza_khabar/features/home/widgets/news_card.dart';
import 'package:taaza_khabar/palette.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<String, String> countryEndpoints = {};
  String selectedCountry = '';
  List articles = [];

  @override
  void initState() {
    super.initState();
    loadCountryEndpoints();
  }

  Future<void> loadCountryEndpoints() async {
    try {
      Map<String, String> fetchedEndpoints = await fetchCountryEndpoints();
      setState(() {
        countryEndpoints = fetchedEndpoints;
        selectedCountry = countryEndpoints.containsKey('US')
            ? 'US'
            : countryEndpoints.keys.first;
      });

      fetchArticlesForCountry(selectedCountry);
    } catch (e) {
      print('Error loading Country Endpoints: $e');
    }
  }

  void fetchArticlesForCountry(String country) {
    FetchNews.fetchNews(countryEndpoints[country]!).then((fetchedArticles) {
      setState(() {
        articles = fetchedArticles
            .where((article) => article['title'] != '[Removed]')
            .toList();
      });
    }).catchError((error) {
      print('Error fetching news: $error');
    });
  }

  String formatTimeAgo(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} secs ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} mins ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return DateFormat('dd MMM yyyy').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<UserAuthProvider>(context);
    return Scaffold(
      backgroundColor: AppPalette.lightGreyColor,
      appBar: AppBar(
        backgroundColor: AppPalette.blueColor,
        title: const Text(
          'MyNews',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          // ElevatedButton.icon(
          //   onPressed: () {},
          //   label: const Text(
          //     'data',
          //     style: const TextStyle(
          //       color: Colors.white,
          //     ),
          //   ),
          //   icon: const Icon(
          //     Icons.location_on_outlined,
          //     color: Colors.white,
          //   ),
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: Colors.transparent,
          //     shadowColor: Colors.transparent,
          //   ),
          // ),
          DropdownButton(
            value: selectedCountry,
            icon: const Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.white,
            ),
            dropdownColor: Colors.black,
            style: const TextStyle(color: Colors.white),
            onChanged: (String? newCountry) {
              setState(() {
                selectedCountry = newCountry!;
              });
              FetchNews.fetchNews(countryEndpoints[selectedCountry]!)
                  .then((articles) {
                setState(() {
                  this.articles = articles;
                });
              }).catchError((error) {
                print('Error Fetching news: $error');
              });
            },
            items: countryEndpoints.keys
                .map<DropdownMenuItem<String>>((String country) {
              return DropdownMenuItem<String>(
                value: country,
                child: Text(
                  country,
                  style: const TextStyle(
                      // color: Colors.white,
                      ),
                ),
              );
            }).toList(),
          ),
          IconButton(
            onPressed: () async {
              await authProvider.logout(context: context);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top Headlines',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return NewsCard(
                    headline: articles[index]['title'] ?? '',
                    description: articles[index]['description'] ?? '',
                    publishedAt: formatTimeAgo(articles[index]['publishedAt']),
                    imageUrl: articles[index]['urlToImage'] ?? '',
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
