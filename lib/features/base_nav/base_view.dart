import 'package:experimental/features/base_nav/nav_controller.dart';
import 'package:extra_alignments/extra_alignments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:experimental/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseNav extends ConsumerStatefulWidget {
  const BaseNav({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseNavState();
}

class _BaseNavState extends ConsumerState<BaseNav> {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Can not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    int selectionIndexFromState = ref.watch(navControllerProvider);
    DeepState deepStateState = ref.watch(deepStateController);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gameboy.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            52.1.sbH,
            //! actual screen
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: Container(
                height: 273.h,
                width: 317.w,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 244, 247, 1),
                    borderRadius: BorderRadius.circular(15.r)),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      10.sbH,
                      deepStateState.title
                          .toUpperCase()
                          .txt(
                            size: 20.sp,
                            fontWeight: FontWeight.bold,
                          )
                          .animate()
                          .fadeIn(duration: 0.5.seconds)
                          .slide(begin: const Offset(0, -.2)),

                      20.sbH,
                      //! list
                      ...List.generate(
                        deepStateState.options.length,
                        (index) => Container(
                          // height: 30.h,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 5.h)
                              .copyWith(left: 16.w),
                          margin: EdgeInsets.only(bottom: 7.h),
                          color: selectionIndexFromState == index
                              ? Colors.grey.withOpacity(0.5)
                              : null,
                          child: CenterLeft(
                              child: deepStateState.options[index]
                                  .txt(size: 16.sp)),
                        )
                            .animate()
                            .fadeIn(delay: (index * 0.2).seconds,  duration: 0.7.seconds)
                            .slide(begin: const Offset(0, -.2)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 40.h,
              width: 300.w,
              color: Colors.black,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    'iteoluwakiisi'.txt(
                      size: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    '.dart'.txt(
                      size: 13.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),

            170.sbH,
            SizedBox(
              height: 130.h,
              width: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  28.sbW,
                  //! D-PAD
                  SizedBox(
                    height: double.infinity,
                    width: 137.w,
                    child: Stack(
                      children: [
                        //! up
                        TopCenter(
                          child: SizedBox(
                            height: 45.h,
                            width: 35.w,
                          ).tap(onTap: () {
                            moveUp(ref);
                          }),
                        ),

                        //! down
                        BottomCenter(
                          child: SizedBox(
                            height: 45.h,
                            width: 35.w,
                          ).tap(onTap: () {
                            if (selectionIndexFromState !=
                                deepStateState.options.length - 1) {
                              moveDown(ref);
                            }
                          }),
                        ),

                        //! left
                        CenterLeft(
                          child: SizedBox(
                            height: 35.h,
                            width: 45.w,
                          ).tap(onTap: () {
                            moveUp(ref);
                          }),
                        ),

                        //! right
                        CenterRight(
                          child: SizedBox(
                            height: 35.h,
                            width: 45.w,
                          ).tap(onTap: () {
                            if (selectionIndexFromState !=
                                deepStateState.options.length - 1) {
                              moveDown(ref);
                            }
                          }),
                        )
                      ],
                    ),
                  ),

                  42.sbW,
                  SizedBox(
                    height: 105.h,
                    width: 150.w,
                    child: Stack(
                      children: [
                        //! A button
                        TopRight(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30.w,
                              backgroundColor: Colors.transparent,
                            ).tap(onTap: () {
                              switch (selectionIndexFromState) {
                                case 0:
                                  if (deepStateState.title == 'welcome') {
                                    ref
                                        .read(deepStateController.notifier)
                                        .changeDeepState(
                                            newDeepState: DeepState(
                                                title: deepStateState.options[
                                                    selectionIndexFromState],
                                                options: aboutOptions));
                                    initi(ref);
                                  }

                                  if (deepStateState.title == 'Projects') {
                                    _launchURL('https://onelink.to/fbesj3');
                                  }

                                  if (deepStateState.title == 'Connect') {
                                    _launchURL(
                                        'https://x.com/thatsaxydev?s=21');
                                  }

                                  break;

                                case 1:
                                  if (deepStateState.title == 'welcome') {
                                    _launchURL(
                                        'https://drive.google.com/file/d/1iR1uKwI78K0A8zpGD3PxQ6A6Iew0zK85/view?usp=drivesdk');
                                  }

                                  if (deepStateState.title == 'Connect') {
                                    _launchURL(
                                        'https://github.com/ThatSaxyDev');
                                  }

                                  break;

                                case 2:
                                  if (deepStateState.title == 'welcome') {
                                    ref
                                        .read(deepStateController.notifier)
                                        .changeDeepState(
                                            newDeepState: DeepState(
                                                title: deepStateState.options[
                                                    selectionIndexFromState],
                                                options: projectOptions));
                                    initi(ref);
                                  }

                                  if (deepStateState.title == 'Connect') {
                                    _launchURL('https://wa.me/9015771804');
                                  }
                                  break;

                                case 3:
                                  if (deepStateState.title == 'welcome') {
                                    ref
                                        .read(deepStateController.notifier)
                                        .changeDeepState(
                                            newDeepState: DeepState(
                                                title: deepStateState.options[
                                                    selectionIndexFromState],
                                                options: contactOptions));
                                    initi(ref);
                                  }

                                  break;
                                default:
                              }
                            }),
                          ),
                        ),

                        //! B button
                        BottomLeft(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 30.w,
                              backgroundColor: Colors.transparent,
                            ).tap(onTap: () {
                              initi(ref);
                              ref
                                  .read(deepStateController.notifier)
                                  .backToWelcome();
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> options = [
  'About',
  'Resume',
  'Projects',
  'Connect',
];

List<String> aboutOptions = [
  'Name: DEDEKE DAVID ITEOLUWAKIISI',
  'Skill: FLUTTER DEV',
  'AGE: 23',
  'Gender: MALE',
];

List<String> projectOptions = [
  'Retro Wallet - open beta',
];

List<String> contactOptions = [
  'Twitter',
  'Github',
  'Whatsapp',
];
