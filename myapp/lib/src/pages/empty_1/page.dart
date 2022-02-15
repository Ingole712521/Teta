import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:myapp/auth/auth_state.dart';

import 'package:myapp/src/pages/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:paged_vertical_calendar/paged_vertical_calendar.dart';

class PageEmptyA1 extends StatefulWidget {
  const PageEmptyA1({
    Key? key,
  }) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends AuthState<PageEmptyA1>
    with SingleTickerProviderStateMixin {
  final datasets = <String, dynamic>{};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000),
      body: Stack(
        children: [
          Stack(
            children: [
              Image.network(
                r'''https://images.hindustantimes.com/img/2021/09/23/1600x900/_c79199ce-fd27-11ea-9be4-f86a557f0827_1632365338736.jpg''',
                width: double.maxFinite,
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
