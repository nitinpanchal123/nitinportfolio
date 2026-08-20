import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

Future<void> openMail({
  required String email,
  String subject = '',
  String body = '',
}) {
  final uri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject.isNotEmpty) 'subject': subject,
      if (body.isNotEmpty) 'body': body,
    },
  );
  return launchUrl(uri);
}

Future<void> openResume() {
  return openUrl('${Uri.base.origin}/Nitin-Mistry-Resume.pdf');
}

Future<void> openWebsite() {
  return openUrl('${Uri.base.origin}/');
}
