import 'package:bhk_seller_app/resources/appconstants.dart';
import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: AppConstants.customGradient,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "Notifications".toUpperCase(),
          style: const TextStyle(fontSize: 15, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.update, color: Colors.orange),
                title: const Text(
                  'System Update',
                ),
                subtitle: const Text(
                  'A new update is available for your system.',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.red),
                  onPressed: () {
                    // Handle dismiss notification
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.update, color: Colors.orange),
                title: const Text(
                  'System Update',
                ),
                subtitle: const Text(
                  'A new update is available for your system.',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.red),
                  onPressed: () {
                    // Handle dismiss notification
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Card(
              child: ListTile(
                leading: const Icon(Icons.update, color: Colors.orange),
                title: const Text(
                  'System Update',
                ),
                subtitle: const Text(
                  'A new update is available for your system.',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.red),
                  onPressed: () {
                    // Handle dismiss notification
                  },
                ),
              ),
            ),
          ),
          const Spacer(), // Push the button to the bottom
          Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Close',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )),
          const SizedBox(height: 25)
        ],
      ),
    );
  }
}
