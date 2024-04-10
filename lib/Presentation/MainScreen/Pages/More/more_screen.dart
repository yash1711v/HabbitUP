import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttermoji/fluttermojiCircleAvatar.dart';
import 'package:habitup/FirebaseFunctionality/AuthenticationFeatures.dart';
import 'package:habitup/LocalStorage/SharedPref/Sharedpref.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../ScheduleNotifications/notification_scheduler.dart';
import '../../../../Widgets/edit_avator.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  String name="Guest";
  String email="xyz@gmail.com";
  String Uid=" ";
  bool notification=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEmailandName();
  }
  Future<void> privacyScren() async {
    const url = 'https://sites.google.com/view/habitup-privacy-policy/home'; // Replace with your privacy policy URL
    await launchUrl(Uri.parse(url));
  }
  Future<void> RateAndShareApp() async {
    const url = 'https://play.google.com/store/apps/details?id=com.habitapps.habitup'; // Replace with your privacy policy URL
    await launchUrl(Uri.parse(url));
  }
  getEmailandName() async {
    // get email and name from shared preferences
    String name1=await Sharedpref().getUsername();
    String email1=await Sharedpref().getEmail();
    String Uid1=await Sharedpref().getUid();
    setState(() {
      name=name1;
      email=email1;
      Uid=Uid1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    HapticFeedback.lightImpact();
                    EditAvator(context);
                  },
                  child: FluttermojiCircleAvatar(
                    radius: 70,
                    backgroundColor:
                        Theme.of(context).textTheme.titleMedium?.color,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontSize: 24,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.05,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,top: 3),
                  child: SvgPicture.asset(
                    "assets/ImagesY/SettingsScreen/Edit.svg",
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    width: 18,
                    height: 18,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  email,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium?.color,
                    fontSize: 12,
                    fontFamily: 'DM Sans',
                    fontWeight: FontWeight.w400,
                    height: 0.10,
                  ),
                )

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'Notifications',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ImagesY/RoutineScreen/BlackBellIcon.svg",
                        color:
                        Theme.of(context).textTheme.titleMedium?.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                            color: Theme.of(context).textTheme.titleMedium?.color,
                            fontSize: 16,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Switch(
                          value: notification,
                          onChanged: (value) {
                            setState(() {
                              notification = value;
                            });
                            flutterLocalNotificationsPlugin.cancelAll();
                          },
                          activeColor: Colors.transparent,
                          thumbColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return  Theme.of(context).textTheme.titleMedium?.color; // Change the color when selected
                            }
                            return Colors.grey; // Default color
                          }),
                          trackOutlineColor:
                          MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.grey; // Change the color when disabled
                            }
                            return Colors.grey; // Default color
                          }),
                          inactiveTrackColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:20,left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'Feedback',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ImagesY/SettingsScreen/RateAppIcon.svg",
                        color:
                        Theme.of(context).textTheme.titleMedium?.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextButton(
                          onPressed: (){
                            RateAndShareApp();
                          },
                          child: Text(
                            'Rate Habitup 5 Stars',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.titleMedium?.color,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ImagesY/SettingsScreen/ShareApp.svg",
                        color:
                        Theme.of(context).textTheme.titleMedium?.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextButton(

                          onPressed: () async {
                            final urlI='https://play.google.com/store/apps/details?id=com.habitapps.habitup';
                            try {
                              await Share.share(
                                'Check out this app: $urlI',
                                subject: 'App Sharing',
                              );
                            } catch (e) {
                              // Handle exceptions, if any
                              print('Error sharing: $e');
                            }
                          },
                          child: Text(
                            'Share app with your friends',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.titleMedium?.color,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15,left: 15.0),
                  child: Row(
                    children: [
                      Text(
                        'Others',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w400,
                          height: 0.10,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 10),
                  child: GestureDetector(
                    onTap: (){
                      privacyScren();
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/ImagesY/SettingsScreen/PrivacyPolicy.svg",
                          color:
                          Theme.of(context).textTheme.titleMedium?.color,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: TextButton(
                            onPressed: (){
                              privacyScren();
                            },
                             child: Text(
                              'Privacy Policy',
                              style: TextStyle(
                                color: Theme.of(context).textTheme.titleMedium?.color,
                                fontSize: 20,
                                fontFamily: 'DM Sans',
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,top: 0),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        "assets/ImagesY/SettingsScreen/Logout.svg",
                        color:
                        Theme.of(context).textTheme.titleMedium?.color,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextButton(
                          onPressed: (){
                            AuthenticationFeatures().signout();
                          },
                         child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Theme.of(context).textTheme.titleMedium?.color,
                              fontSize: 20,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
