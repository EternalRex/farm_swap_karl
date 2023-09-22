import "package:farm_swap_karl/colors/colors.dart";
import 'package:farm_swap_karl/pages/dashboard_page/widgets/dsb_common_widget/widget_dashboard_txt.dart';
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class AdminEditProfileBtn extends StatefulWidget {
  const AdminEditProfileBtn({super.key});

  @override
  State<AdminEditProfileBtn> createState() => _AdminEditProfileBtnState();
}

class _AdminEditProfileBtnState extends State<AdminEditProfileBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 130,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, farmSwapTitlegreen],
          begin: Alignment.center,
          end: Alignment.center,
          stops: const [0.12, 0.25],
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: Center(
        child: TextButton(
          onPressed: () {},
          child: DashBoardTxt(
            myText: "Edit Profile",
            myColor: Colors.white,
            mySize: 15,
            myFont: GoogleFonts.poppins().fontFamily,
            myWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
