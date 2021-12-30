import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4_outlined,
              size: 50,
              color: Colors.white,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'No Internet!',
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'developed by umarBDev , github/mUmarBaloch',
              style: TextStyle(
                color: Colors.white38,
              ),
            )
          ],
        ),
      ),
    );
  }
}
