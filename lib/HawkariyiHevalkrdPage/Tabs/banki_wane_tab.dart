import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/banki_wane_provider.dart';
import '../../Models/ObjectModels/wane.dart';
import '../Components/wane_detail.dart';

class BankiWaneTab extends StatelessWidget {
  void _openWaneDetail(BuildContext context, Wane selectedWane) {
    Provider.of<BankiWaneProvider>(context, listen: false)
        .setSelectedWane(selectedWane);
    Navigator.of(context).pushNamed(WaneDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final bankiWaneProvider = Provider.of<BankiWaneProvider>(context);
    List<Wane> _bankiWane = bankiWaneProvider.bankiWane;
    bool isLoading = bankiWaneProvider.isLoading;

    return isLoading
        ? Center(child: CircularProgressIndicator())
        : Scaffold(
            body: ListView.builder(
              itemCount: _bankiWane.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  elevation: 5,
                  child: ListTile(
                    leading: Text("${_bankiWane[index].userUsername}: "),
                    title: Text(_bankiWane[index].title),
                    subtitle: Text(_bankiWane[index].uploadGroupName),
                    onTap: () {
                      _openWaneDetail(context, _bankiWane[index]);
                    },
                  ),
                );
              },
            ),
          );
  }
}
