import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  }
}

Future<void> openMail({required String email, String? subject, String? body}) async {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject != null) 'subject': subject,
      if (body != null) 'body': body,
    },
  ).toString();
  await openUrl(uri);
}

Future<void> openResume() async {
  // In a real app, this might open a PDF or a URL.
  // For this portfolio, we'll point to a placeholder or the actual asset if possible.
  // Since url_launcher can't easily open assets on all platforms, 
  // we usually host the resume online.
  await openUrl('https://github.com/nitinmistry'); 
}

Future<void> openWebsite() async {
  await openUrl('https://nitinmistry.com');
}
