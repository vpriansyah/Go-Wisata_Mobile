import 'package:desa_wisata/theme.dart';
import 'package:desa_wisata/user/akun_user.dart';
import 'package:desa_wisata/user/akun_user_2.dart';
import 'package:desa_wisata/user/daftar_pesanan_user.dart';
import 'package:desa_wisata/user/daftar_pesanan_user_2.dart';
import 'package:desa_wisata/user/homepage_user.dart';
import 'package:desa_wisata/user/home_user.dart';
import 'package:flutter/material.dart';


class MainPageUser extends StatefulWidget {
  const MainPageUser({Key? key}) : super(key: key);

  @override
  State<MainPageUser> createState() => _MainPageUserState();
}

class _MainPageUserState extends State<MainPageUser> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        backgroundColor: Color(0xFFFFFFFF),
        currentIndex: currentIndex,
        onTap: (value) {
          print(value);
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 25,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              size: 25,
            ),
            label: 'Daftar Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_rounded,
              size: 25,
            ),
            label: 'Akun',
          )
        ],
        selectedItemColor: buttonColor,
        unselectedItemColor: Color(0xF8A000000),
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return home_user();
          break;
        case 1:
          return DaftarPesananUser2();
          break;
        case 2:
          return AkunUser2();
          break;

        default:
          return home_user();
      }
    }

    return Scaffold(
      backgroundColor: background3,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
