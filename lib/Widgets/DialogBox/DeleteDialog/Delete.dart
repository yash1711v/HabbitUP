import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteScreen extends StatefulWidget {
  String habitname;
  final Function(String) callback;
  DeleteScreen({super.key, required this.callback,required this.habitname});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        width: 450,
        height: 235,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          color:Theme.of(context).textTheme.bodyMedium?.color==Colors.black?Colors.white:Color(0xFF1F1F1F),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 450,
              height: 63,
              decoration: const BoxDecoration(color: Color(0xFFA8E32C)),
              child: Center(child: Text(
                  "Delete",
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
              padding: const EdgeInsets.only(top: 14.0),
              child: SizedBox(
                width: 244,
                height: 24,
                child: Text(
                  widget.habitname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                 color: Color(0xFFA8E32C),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text("Do you want to delete the habit “${widget.habitname}” permanently. This action cannot be undone.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color,
                  fontSize: 16,
                  fontFamily: 'DM Sans',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
            ),),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    }, child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
                ),

                TextButton(onPressed: (){

                  widget.callback(controller.text);
                  Navigator.pop(context);

                }, child: Text(
                  'Delete',
                  style: TextStyle(
                    color: Color(0xFFA8E32C),
                    fontSize: 16,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )),
                SizedBox(width: 10,)
              ],
            ),

          ],
        ),
      ),
    );
  }
}