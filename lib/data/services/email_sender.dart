import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailSender {
  static Future<void> sendEmail(
      {required String name,
      required String email,
      required String subject,
      required String message}) async {
    const serviceId = 'service_xcdi5n9';
    const templateId = 'template_q2bl26b';
    const userId = 'EWGGquDjA_KGU1pMG';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'from_name': email,
            'user_subject': subject,
            'message': message
          }
        }));
  }
}
