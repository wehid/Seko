import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/wane_group.dart';
import '../../Models/ProviderModel/banki_wane_provider.dart';

class DropdownWaneGroup extends StatefulWidget {
  @override
  _DropdownWaneGroupState createState() => _DropdownWaneGroupState();
}

class _DropdownWaneGroupState extends State<DropdownWaneGroup> {
  BankiWaneProvider _bankiWaneProvider;
  List<WaneGroup> _waneGroupList;
  WaneGroup _currentWaneGroup;

  @override
  void initState() {
    _bankiWaneProvider = Provider.of<BankiWaneProvider>(context, listen: false);
    _waneGroupList = _bankiWaneProvider.waneGroupList;
    _currentWaneGroup = _waneGroupList[0];
    _bankiWaneProvider.setSelectedWaneGroup(_currentWaneGroup);

    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   _bankiWaneProvider.setSelectedWaneGroup(_currentWaneGroup);
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // _bankiWaneProvider = Provider.of<BankiWaneProvider>(context);

    return Container(
      width: double.infinity,
      height: 55,
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: DropdownButton<WaneGroup>(
        value: _currentWaneGroup,
        onChanged: (newWaneGroup) {
          _bankiWaneProvider.setSelectedWaneGroup(newWaneGroup);
          setState(() {
            _currentWaneGroup = newWaneGroup;
          });
        },
        icon: Icon(Icons.arrow_downward_outlined),
        items: _waneGroupList.map((waneGroup) {
          return DropdownMenuItem<WaneGroup>(
            value: waneGroup,
            child: Text(waneGroup.title),
          );
        }).toList(),
      ),
    );
  }
}
