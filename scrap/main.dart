import 'package:web_scraper/web_scraper.dart';

Future<void> main() async {
  final webScraper = WebScraper('https://www.taptap.com');
  if (await webScraper.loadWebPage('/video/1432918')) {
    var x = webScraper.getPageContent();
    print(x);
  }
}
