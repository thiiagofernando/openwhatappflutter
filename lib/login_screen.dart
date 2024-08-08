import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Falha ao abrir $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController numeroCtrl = TextEditingController();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 100, bottom: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/whatsapp-logo.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: numeroCtrl,
                decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Informe o N.º'),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (numeroCtrl.text.isNotEmpty) {
                    _launchInBrowser(Uri.parse('https://wa.me/55${numeroCtrl.text}'));
                  }
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50), backgroundColor: Colors.green),
                child: const Text('Abrir Whatsapp', style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
