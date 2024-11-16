import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AddFriend extends StatelessWidget {
  const AddFriend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  appBar(),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40,left: 20,right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff1D1617).withOpacity(0.11),
                  blurRadius: 40,
                  spreadRadius: 0.0
                )
              ]
            ),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.all(15),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/search_icon.svg'),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
        ],
      ),

    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'Add Friend',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        )
        ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: SvgPicture.asset(
          'assets/icons/arrow-u-down-left-svgrepo-com.svg',
          height: 30,
          width: 30
        ),
      ),
    );
  }
}