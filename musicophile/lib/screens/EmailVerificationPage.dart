import 'package:flutter/material.dart';


class EmailVerificationPage extends StatefulWidget {
  const EmailVerificationPage({super.key});

  @override
  State<EmailVerificationPage> createState() => _EmailVerificationPageState();
}

class _EmailVerificationPageState extends State<EmailVerificationPage> {
  @override
  Widget build(BuildContext context) {
    final String? userEmail = ModalRoute.of(context)?.settings.arguments.toString();
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("$userEmail"),
          ],
        ),
      ),
    );
  }
}