import 'package:flutter/material.dart';

class AppbarTitle extends StatelessWidget {
  final bool hasNotificationData;

  const AppbarTitle({
    Key? key,
    this.hasNotificationData = false,
  }) : super(key: key);

  void _showNotificationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Notification'),
        content: Center(
            child: Container(height: 100, child: Text('No Notification.'))),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (BuildContext context) {
              return /*IconButton(
                icon: Image(
                  color: Colors.white,
                  width: 20,
                  height: 30,
                  image: AssetImage(Constant.Menu),
                ),*/
                  IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          /*Stack(
            alignment: Alignment.topRight,
            children: [
              InkWell(
                onTap: () {
                  _showNotificationPopup(context);
                },
                child: Image(
                  color: Colors.white,
                  width: 20,
                  height: 30,
                  image: AssetImage(Constant.Bell),
                ),
              ),*/
          if (hasNotificationData)
            Container(
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
      // ],
      //  ),
    );
  }
}
