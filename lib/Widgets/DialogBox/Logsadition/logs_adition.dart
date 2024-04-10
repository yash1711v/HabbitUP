import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogsAdition extends StatefulWidget {
  final Function(String) callback;
   LogsAdition({super.key, required this.callback});

  @override
  State<LogsAdition> createState() => _LogsAditionState();
}

class _LogsAditionState extends State<LogsAdition> {
  TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        width: 450,
        height: 310,
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
                  "Progress",
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
                  'Journal Your Today’s Progess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
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
              child: TextField(
                controller: controller,
                maxLines: 4,
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyMedium?.color
                ),
              ),
            ),

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
                  'Save',
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

class LogsUpdate extends StatefulWidget {
  TextEditingController controller;
  final Function(String) callback;
 final String date;
   LogsUpdate({super.key,required this.controller, required this.callback,required this.date});

  @override
  State<LogsUpdate> createState() => _LogsUpdateState();
}

class _LogsUpdateState extends State<LogsUpdate> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 2,
      child: Container(
        width: 450,
        height: 310,
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
                  "Progress",
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
                width: 270,
                height: 24,
                child: Text(
                  'Update Your ${widget.date}’s Progess',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
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
              child: TextField(
                controller: widget.controller,
                maxLines: 4,
                style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color
                ),
              ),
            ),

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

                  widget.callback(widget.controller.text);
                  Navigator.pop(context);

                }, child: Text(
                  'Save',
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
    );;
  }
}
