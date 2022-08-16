import 'package:flutter/material.dart';

class LoadingDialog extends StatefulWidget {
  final String title;
  const LoadingDialog({Key? key, this.title = 'LoadingDialog'})
      : super(key: key);
  @override
  LoadingDialogState createState() => LoadingDialogState();
}

class LoadingDialogState extends State<LoadingDialog> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
          "https://mir-s3-cdn-cf.behance.net/project_modules/disp/da734b28921021.55d95297d71f4.gif",
          scale: 3),
    );
  }
}
