import 'package:WHOFlutter/components/page_button.dart';
import 'package:WHOFlutter/generated/l10n.dart';
import 'package:flutter/material.dart';

class PermissionRequestPage extends StatelessWidget {
  final String pageTitle;
  final String pageDescription;
  final String buttonTitle;
  final String backgroundImageSrc;
  final VoidCallback onGrantPermission;
  final VoidCallback onSkip;

  const PermissionRequestPage({
    Key key,
    @required this.pageTitle,
    this.pageDescription = "",
    @required this.buttonTitle,
    @required this.onGrantPermission,
    @required this.onSkip,
    this.backgroundImageSrc
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Center(child:this.backgroundImageSrc!=null?Image.asset(this.backgroundImageSrc, fit: BoxFit.contain, alignment: Alignment.center,):FlutterLogo(size: 75)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16.0, vertical: 50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Text(this.pageTitle, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),),
                      SizedBox(height: 17,),
                      Text(this.pageDescription, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),)
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    PageButton(
                      Color(0xff3b8bc4),
                      buttonTitle,
                      onGrantPermission,
                      titleStyle: TextStyle(),
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      verticalPadding: 24,
                      borderRadius: 35,
                    ),
                    FlatButton(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        S.of(context).onBoardingLocationSharingPageButtonSkip,
                        style: TextStyle(color: Colors.grey),
                      ),
                      onPressed: onSkip,
                    ),
                  ],
                ),
              ],
            ),

          ),
        ],
      ),
    );
  }
}
