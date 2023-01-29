import 'package:flutter/material.dart';

void showLoading(String message, BuildContext context) {
  showDialog(context: context,
    barrierDismissible: false,
    builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AlertDialog(
        actions: [
          Text(message),
          const CircularProgressIndicator(),

        ],
      ),
    );
  },);

}
void showMessage(String message , BuildContext context, String postActionBtn, VoidCallback posAction )
{
    showDialog(context: context, builder: (context) {
      return AlertDialog(actions: [
        TextButton(onPressed: posAction, child: Text(postActionBtn))],title: Text(message));
    },) ;
}

void hideLoading (BuildContext context){
  Navigator.pop(context);
}