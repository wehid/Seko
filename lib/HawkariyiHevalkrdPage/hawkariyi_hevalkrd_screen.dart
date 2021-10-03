import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/banki_wane_provider.dart';
import '../Models/ObjectModels/wane.dart';
import 'SubPage/wane_detail.dart';
import '../constants.dart';

class HawkariyiHevalkrdScreen extends StatelessWidget {
  static const routeName = '/hawkariyi-hevalkrd';

  void _openWaneDetail(BuildContext context, Wane selectedWane){
    //todo: delete print
    print(selectedWane.title);
    Provider.of<BankiWaneProvider>(context, listen: false).setSelectedWane(selectedWane);
    Navigator.of(context).pushNamed(WaneDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    List<Wane> _bankiWane = Provider.of<BankiWaneProvider>(context, listen: false).bankiWane;



    return Scaffold(
      appBar: customAppBar('هاوکاریی هەڤاڵکرد'),
      body: ListView.builder(
        itemCount: _bankiWane.length,
        itemBuilder: (context, index){
          return Card(
            margin: const EdgeInsets.all(10),
            elevation: 5,
            child: ListTile(
              leading: Text("${_bankiWane[index].userUsername}: "),
              title: Text(_bankiWane[index].title),
              subtitle: Text(_bankiWane[index].uploadGroupName),
              onTap: (){
                _openWaneDetail(context, _bankiWane[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
