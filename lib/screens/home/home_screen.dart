import 'package:flutter/cupertino.dart';

import '../../app_exporter.dart';
import '../link/link_body.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const AppHorizontalLogo(
          logoSize: 40,
        ),
        centerTitle: true,
        backgroundColor: appWhite,
        actions: <Widget>[
          Padding(
            padding: padding8,
            child: CircleAvatar(
              backgroundColor: appBlack,
              child: IconButton(
                icon: const Icon(
                  CupertinoIcons.person,
                  color: appWhite,
                ),
                onPressed: () {
                  push(ref, to: profilePath);
                },
              ),
            ),
          ),
        ],
      ),
      body: const LinkBody(),
    );
  }
}
