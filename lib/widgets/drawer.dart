import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://lh3.googleusercontent.com/7pyYzBnGUbux2dyPGoi8A-x5vLOsCkN7ixi73giNzj9FzmZa48MuTosQIZuHD_Q0WKPZVKncWZBKhXXQ7VcH54pHem4n4RWBiQzy8DipP0JjVMiVmcKtPZUZ6slE2i1uywpT_jVmBxWr83Ab53nOI6bD4HI_3sJFq5MFoWSm_JsD2nk2HwmoVcCgnzF8zSygQTEnC348PoYGN34TeXmidH_mX4GTGxNnpImFmgN2-LKOjXmrAM_XpWoVaEQO2b6cu8xyN_0uIny0P3LBAt4Unt12dg_BfP-FUQzYVwaK7ikzjOVZ6I82VViES3X0gsZDMUYjLndYGrOwK7st_9WR8Tzsk2QoDBS4h9TSRNvFHaAP21VUPX0isoAWNFjVsxZknI9VO9CSaRkpDE_AQ0VbxGNKl4F3TgpvlxjM1TSIv1YppbRagQiv6kIc5EmVl9k-RAsOKpz0-OOj2n4vfoA0QVbgFS8YVFQiBRhYXEidtkuYjNhtSgHFo8qoKVTTkc2mVdxxVuBvDP6mSmi6d45XRMfkfA0f8AXqEE3loia4KnsLEnoiVgsrPeujDKsj_xCQrR1e0NyFmh3hpHvSmSLSPX6VVz3DoddVigSIi7e7ET-rogtjNVWfSImTdBHz9d1-MwMPjT95LuI8RqpDVLLUX59CZ-Dh9ygxq5d4T15fwkzasgpJZuhNQGao8J2ChfZK45s7yzXBcwhaOFPelWpTbgzE=w450-h625-no?authuser=0";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                accountEmail: Text('ksindhi474@gmail.com'),
                accountName: Text(
                  'Kishan Sindhi',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.3,
                    fontSize: 18,
                  ),
                ),
                margin: EdgeInsets.zero,
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                'Mail Us',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
