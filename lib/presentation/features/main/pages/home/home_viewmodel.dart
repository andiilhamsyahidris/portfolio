import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final String _errorMessage = "";
  String get errorMessage => _errorMessage;

  void sendEmail() async {
    final Email email = Email(
      recipients: [Constant.email],
      subject: Constant.subjectEmail,
      body: Constant.bodyEmail,
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }
}
