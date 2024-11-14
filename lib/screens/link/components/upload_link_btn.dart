import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import '../data/models/app_link.dart';
import '../data/services/link_service.dart';

/// used to submit biz information
class UploadLinkButton extends ConsumerStatefulWidget {
  /// constructor
  const UploadLinkButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UploadLinkButtonState();
}

class _UploadLinkButtonState extends ConsumerState<UploadLinkButton> {
  // istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    final appError = ref.watch(appErrorProvider);
    return SizedBox(
      height: kButtonHeight,
      child: CircularProgressAppButton(
        isTapped: isButtonTapped,
        text: 'Continue',
        onTap: () async {
          resetAppError(ref);

          enableTap();

          // link
          final link = defaultAppLink;

          printer('Link: $link');

          // await mockFuture().then((_) {
          await LinkService.uploadLink(link: link, ref: ref).then((_) async {
            printer('Link uploaded successfully');
            // Go to Home if there is no error
            if (appError == null) {
              // reset providers
              // resetLinkForm(ref);

              // disable tap
              disableTap();

              // go to home
              // go(ref, to: homePath);
            }
          });
        },
        icon: CupertinoIcons.rectangle_3_offgrid_fill,
        textColor: appDarkColor,
        buttonColor: caribbeanGreen,
      ),
    );
  }

  // enable tap
  void enableTap() {
    setState(() {
      isButtonTapped = true;
    });
  }

  /// Disable the button tap
  void disableTap() {
    if (mounted) {
      setState(() {
        isButtonTapped = false;
      });
    }
  }
}
