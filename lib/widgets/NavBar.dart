import 'package:flutter/material.dart';
import 'package:train_planner/screens/others.dart';
import '../screens/news.dart';
import '../screens/stationlist.dart';
import '../screens/planner.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/trainlist.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 199, 249, 204),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 30,
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'หน้าหลักอื่นๆ',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Others()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.newspaper,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'ข่าวสาร',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const News()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.account_balance,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'รายชื่อสถานี',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Stationlist()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.tour,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'โปรแกรมท่องเที่ยวรถไฟ',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Planner()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.train,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'ข้อมูลขบวนรถ',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Trainlist()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.route,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'เส้นทางรถไฟ',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Planner()));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.access_time_filled,
              size: 35,
              color: Colors.black,
            ),
            title: Text(
              'กำหนดเวลาเดินรถ',
              style: GoogleFonts.prompt(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Planner()));
            },
          ),
        ],
      ),
    );
  }
}
