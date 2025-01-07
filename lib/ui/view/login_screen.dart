import 'package:bancodchina/ui/view/dashboarding_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.asset('assets/images/logocima.png'),
            Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset('assets/images/start.png')),
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/logo_bancodchina.png',
                    width: 150,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 32),
                        const Text(
                          'Sistema de Gestão de Contas',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 32),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            label: Text('Email'),
                          ),
                        ),
                        SizedBox(height: 32),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text('Senha'),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardingScreen()));
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xffF35D5D),
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
