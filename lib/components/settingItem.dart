
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key, required this.label, required this.icon,
  });
  final String label;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child:  Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 5),
        child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children: [
           Row(
             children: [
                icon,
                const SizedBox(width: 10,),
               Text(label, style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
             ],
           ),
           const Icon(Icons.arrow_forward_ios,)
         ],
                    ),
      ),
    );
  }
}

