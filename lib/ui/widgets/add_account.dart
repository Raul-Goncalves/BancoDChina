import 'package:bancodchina/models/account.dart';
import 'package:bancodchina/services/account_service.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

class _AddAccountState extends State<AddAccount> {
  String _accountType = 'AMBROSIA';

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      padding: EdgeInsets.only(
        left: 32,
        right: 32,
        top: 32,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                "assets/images/icon_add_account.png",
                width: 64,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "Adicionar nova conta",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Preencha os dados abaixo:",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(label: Text("Nome")),
            ),
            TextFormField(
              controller: lastnameController,
              decoration: const InputDecoration(label: Text("Último nome")),
            ),
            const SizedBox(height: 16),
            const Text("Tipo da conta"),
            DropdownButton<String>(
              value: _accountType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: "AMBROSIA",
                  child: Text("Ambrosia"),
                ),
                DropdownMenuItem(
                  value: "CANJICA",
                  child: Text("Canjica"),
                ),
                DropdownMenuItem(
                  value: "PUDIM",
                  child: Text("Pudim"),
                ),
                DropdownMenuItem(
                  value: "BRIGADEIRO",
                  child: Text("Brigadeiro"),
                ),
              ],
              onChanged: (valor) {
                if (valor != null) {
                  setState(() {
                    _accountType = valor;
                  });
                }
              },
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (isLoading)
                        ? null
                        : () {
                            onbuttonCancelClicked();
                          },
                    child: const Text(
                      "Cancelar",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      onbuttonSendClicked();
                    },
                    child: (isLoading)
                        ? CircularProgressIndicator()
                        : const Text(
                            "Adicionar",
                            style: TextStyle(color: Colors.black),
                          ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  onbuttonCancelClicked() {
    if (!isLoading) {
      Navigator.pop(context);
    }
  }

  onbuttonSendClicked() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });

      String name = nameController.text;
      String lastname = lastnameController.text;

      Account account = Account(
        id: const Uuid().v1().toString(),
        name: name,
        lastName: lastname,
        balance: 0,
        accountType: _accountType,
      );

      await AccountService().addAccount(account);
      closeModal();

    }
  }

  closeModal(){
    Navigator.pop(context);
  }
}
