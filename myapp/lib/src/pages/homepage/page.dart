import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageHomePage extends StatefulWidget {
  const PageHomePage({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageHomePage>
    with SingleTickerProviderStateMixin {
  String state1 = '0';

  CameraController? state2 = null;

  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
    availableCameras().then(
      (cameras) {
        setState(() {
          state2 = CameraController(cameras[0], ResolutionPreset.max);
          state2.initialize().then((_) {
            if (!mounted) {
              return;
            }
            setState(() {});
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 23,
                top: 50,
              ),
              child: GestureDetector(
                  child: Column(
                children: [
                  Icon(
                    MdiIcons.fromString('home-analytics'),
                    size: 24,
                    color: Color(0xFF28E60F),
                  ),
                  Text(
                    'Home',
                    style: GoogleFonts.average(
                      textStyle: TextStyle(
                        color: const Color(0xFF151515),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    textAlign: TextAlign.right,
                  )
                ],
              )),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Color(0xFF040000),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 400,
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              await Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageSignup(),
                                ),
                              );
                            },
                            child: Container(
                                width: 330,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  '''Sign up''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFF060000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 20,
                        ),
                        child: GestureDetector(
                            onTap: () async {
                              await Navigator.push<void>(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PageSignIn(),
                                ),
                              );
                            },
                            child: Container(
                                width: 330,
                                height: 48,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                    bottomLeft: Radius.circular(15),
                                  ),
                                ),
                                child: Text(
                                  '''Sign in''',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: const Color(0xFF000000),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontStyle: FontStyle.normal,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
                                ))),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 260,
                            ),
                            child: Text(r'''© Meta 2022''',
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                textAlign: TextAlign.left,
                                maxLines: 1),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: -320,
                          top: -1500,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            await Future<void>.delayed(
                                Duration(milliseconds: 1));
                            Navigator.of(context, rootNavigator: true)
                                .pop(null);
                          },
                          child: Icon(
                            MdiIcons.fromString('''keyboard-backspace'''),
                            size: 24,
                            color: Color(0xFFFFF8F8),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 1,
                        top: 56,
                        right: 342,
                      ),
                      child: Icon(
                        MdiIcons.fromString('''hand-back-left'''),
                        size: 34,
                        color: Color(0xFFFEFCFC),
                      ),
                    ),
                    Center(
                      child: Icon(
                        MdiIcons.fromString('''keyboard-backspace'''),
                        size: 88,
                        color: Color(0xFFFFF6F6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
