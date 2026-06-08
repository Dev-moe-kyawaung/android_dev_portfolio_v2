import 'package:url_launcher/url_launcher.dart';

class UrlService {
  static Future<void> open(String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) throw Exception('Could not launch $url');
  }
}
