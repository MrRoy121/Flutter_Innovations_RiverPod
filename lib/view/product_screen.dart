import 'package:flutter/material.dart';
import '../controller/sembast_controller.dart';
import '../model/Accounts.dart';

class AccountScreen extends StatefulWidget {
  final SembastDatabaseService service;

  const AccountScreen(this.service, {Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final _textController = TextEditingController();
  List<Accounts> _accounts = [];

  @override
  void initState() {
    super.initState();
    _loadAccounts();
    _focusNode.requestFocus(); // Request focus on load
  }

  Future<void> _loadAccounts() async {
    _accounts = await widget.service.getAccounts();
    setState(() {});
  }

  Future<void> _addAccount() async {
    final account = Accounts(name: _textController.text, id: _accounts.length+1);
    await widget.service.addAccount(account);
    _textController.clear();
    await _loadAccounts();
  }

  Future<void> _deleteAccount(int id) async {
    await widget.service.deleteAccount(id);
    await _loadAccounts();
  }

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accounts"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _textController,
              focusNode: _focusNode, // Attach focus node
              decoration: InputDecoration(labelText: "Account Name"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Account Name is required";
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: _addAccount,
              child: const Text("Add Account"),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _accounts.length,
                itemBuilder: (context, index) {
                  final account = _accounts[index];
                  return ListTile(
                    title: Text(account.name),subtitle: Text(account.id.toString()),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteAccount(account.id),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
