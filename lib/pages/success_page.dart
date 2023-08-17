import 'package:flutter/material.dart';
import 'package:sweet_smash_app/config.dart';
import 'package:sweet_smash_app/services/shared_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Config.appName),
        elevation: 0,
        actions: [
          //* LOGOUT
          IconButton(
            onPressed: () => SharedService.logout(context),
            icon: const Icon(Icons.logout_rounded),
            color: Colors.white,
          ),
        ],
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Compra realizada con éxito",
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var url = Uri.parse(
                  'https://docs.google.com/forms/d/e/1FAIpQLSe3EdG-p6Zra3fE3BUA2zinR0Weu_WbM-f-ebxGi4ps-aw71w/viewform?usp=sharing',
                );
                _launchUrl(url);
              },
              child: const Text("Realizar encuesta de satisfacción"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, "/home"),
              child: const Text("Volver a inicio"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      throw Exception('Could not launch $url');
    }

    await launchUrl(url, mode: LaunchMode.inAppWebView);
  }
}
