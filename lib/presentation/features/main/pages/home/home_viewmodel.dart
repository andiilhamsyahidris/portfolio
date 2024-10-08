import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  void sendEmail() async {
    final Email email = Email(
      recipients: [""],
      subject: Constant.subjectEmail,
      body: Constant.bodyEmail,
      isHTML: false,
    );
    await FlutterEmailSender.send(email);
  }
}
