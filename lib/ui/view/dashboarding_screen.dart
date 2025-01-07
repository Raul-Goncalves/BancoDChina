import 'package:bancodchina/models/account.dart';
import 'package:bancodchina/services/account_service.dart';
import 'package:bancodchina/ui/widgets/account_widget.dart';
import 'package:bancodchina/ui/widgets/add_account.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class DashboardingScreen extends StatefulWidget {
  DashboardingScreen({super.key});

  @override
  State<DashboardingScreen> createState() => _DashboardingScreenState();
}

class _DashboardingScreenState extends State<DashboardingScreen> {
  Future<List<Account>> _futureGetAll = AccountService().getAll();

  Future<void> refreshGetAll() async {
    setState(() {
      _futureGetAll = AccountService().getAll();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF5F5F5),
        title: Text('Sistema de Gestão de Contas'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return AddAccount();
            },
          );
        },
        backgroundColor: Color(0xffF35D5D),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: RefreshIndicator(
          onRefresh: refreshGetAll,
          child: FutureBuilder(
            future: _futureGetAll,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                  return const Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  {
                    if (snapshot.data == null || snapshot.data!.isEmpty) {
                      return Center(child: Text('Nenhum conta encontrada!'));
                    } else {
                      List<Account> listAccounts = snapshot.data!;
                      return ListView.builder(
                        itemCount: listAccounts.length,
                        itemBuilder: (context, index) {
                          Account account = listAccounts[index];
                          return AccountWidget(account: account);
                        },
                      );
                    }
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
