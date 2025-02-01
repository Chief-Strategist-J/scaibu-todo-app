import 'package:todo_app/core/app_library.dart';

/// show confirm dialog box
Future<T?> appShowConfirmDialogCustom<T>(
  final BuildContext context, {
  required final T Function(BuildContext) onAccept,
  final String? title,
  final String? subTitle,
  final String? positiveText,
  final String? negativeText,
  final String? centerImage,
  final Widget? customCenterWidget,
  final Color? primaryColor,
  final Color? positiveTextColor,
  final Color? negativeTextColor,
  final ShapeBorder? shape,
  final T Function(BuildContext)? onCancel,
  final bool barrierDismissible = true,
  final double? height,
  final double? width,
  final bool cancelable = true,
  final Color? barrierColor,
  final DialogType dialogType = DialogType.CONFIRMATION,
  final DialogAnimation dialogAnimation = DialogAnimation.DEFAULT,
  final Duration? transitionDuration,
  final Curve curve = Curves.easeInBack,
  final Color? backgroundColor,
  final Color? cancelButtonColor,
}) async {
  hideKeyboard(context);

  return showGeneralDialog<T>(
    context: context,
    barrierColor: barrierColor ?? Colors.black54,
    pageBuilder: (
      final BuildContext context,
      final Animation<double> animation,
      final Animation<double> secondaryAnimation,
    ) =>
        Container(),
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    transitionDuration: transitionDuration ?? 400.milliseconds,
    transitionBuilder: (
      final BuildContext a,
      final Animation<double> animation,
      final Animation<double> secondaryAnimation,
      final Widget child,
    ) =>
        dialogAnimatedWrapperWidget(
      animation: animation,
      dialogAnimation: dialogAnimation,
      curve: curve,
      child: AlertDialog(
        shape: shape ?? dialogShape(),
        titlePadding: EdgeInsets.zero,
        backgroundColor: backgroundColor ?? a.cardColor,
        elevation: defaultElevation.toDouble(),
        title: buildTitleWidget(
          a,
          dialogType,
          primaryColor,
          customCenterWidget,
          height ?? customDialogHeight,
          width ?? customDialogWidth,
          centerImage,
          shape,
        ).cornerRadiusWithClipRRectOnly(
          topLeft: defaultRadius.toInt(),
          topRight: defaultRadius.toInt(),
        ),
        content: Container(
          width: width ?? customDialogWidth,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title ?? getTitle(dialogType),
                style: boldTextStyle(size: 16),
                textAlign: TextAlign.center,
              ),
              8.height.visible(subTitle.validate().isNotEmpty),
              Text(
                subTitle.validate(),
                style: secondaryTextStyle(size: 16),
                textAlign: TextAlign.center,
              ).visible(subTitle.validate().isNotEmpty),
              16.height,
              Row(
                children: <Widget>[
                  AppButton(
                    elevation: 0,
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: radius(defaultAppButtonRadius),
                      side: const BorderSide(color: viewLineColor),
                    ),
                    color: cancelButtonColor ?? a.cardColor,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.close,
                          color: negativeTextColor ?? textPrimaryColorGlobal,
                          size: 20,
                        ),
                        6.width,
                        Text(
                          negativeText ?? 'Cancel',
                          style: boldTextStyle(
                            color: negativeTextColor ?? textPrimaryColorGlobal,
                          ),
                        ),
                      ],
                    ).fit(),
                    onTap: () {
                      if (cancelable) {
                        finish(a, false);
                      }

                      onCancel?.call(a);
                    },
                  ).expand(),
                  16.width,
                  AppButton(
                    elevation: 0,
                    color: getDialogPrimaryColor(a, dialogType, primaryColor),
                    shapeBorder: RoundedRectangleBorder(
                      borderRadius: radius(defaultAppButtonRadius),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        getIcon(dialogType),
                        6.width,
                        Text(
                          positiveText ?? getPositiveText(dialogType),
                          style: boldTextStyle(
                            color: positiveTextColor ?? context.primaryColor,
                          ),
                        ),
                      ],
                    ).fit(),
                    onTap: () {
                      onAccept.call(a);

                      if (cancelable) {
                        finish(a, true);
                      }
                    },
                  ).expand(),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
