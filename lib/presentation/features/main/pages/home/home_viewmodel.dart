import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/app/functions.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void sendEmail() {
    final emailLaunchUri = Uri(
      scheme: Constant.schemeEmailUri,
      path: Constant.email,
      query: encodeQueryParameters(<String, String>{
        'subject': Constant.subjectEmail,
        'body': Constant.bodyEmail,
      }),
    );
    emailLaunchUrl(emailLaunchUri);
  }
}
