import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MonthDialogPicker extends StatelessWidget {
  final Function(String) callback;
  const MonthDialogPicker({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        width: 277,
        height: 300,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:Theme.of(context).textTheme.bodyText2?.color==Colors.black?Colors.white:const Color(0xFF1F1F1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 300,
              height: 63,
              decoration: const BoxDecoration(color: Color(0xFFA8E32C)),
              child: Center(child: Text(
                  "Select Month",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.dmSerifDisplay(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontFamily: 'DM Serif Display',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  )
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 39,
                    height: 25,
                    padding: const EdgeInsets.all(5),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFA8E32C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                    ),
                    child: const Center(
                      child: Text("Jan",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.06,
                          letterSpacing: 0.16,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Feb",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Mar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text("Apr",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("May",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("June",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text("July",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Aug",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Sep",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text("Oct",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Nov",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                  Container(
                    child: const Text("Dec",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );;
  }
}
