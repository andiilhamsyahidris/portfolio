import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/presentation/resources/asset_res.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_filled_button.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

enum StateRendererType {
  popupLoadingState,
  popupErrorState,
  popupSuccess,
  fullscreenLoadingState,
  fullscreenSuccessState,
  fullscreenErrorState,
  contentScreenState,
  chooseAccountState,
  emptyScreenState
}

// ignore: must_be_immutable
class StateRenderer extends StatelessWidget {
  StateRendererType stateRendererType;
  String message;
  String title;
  String? textButton;
  Function? actionFunction;
  Function? closeDialogFunction;

  StateRenderer({
    super.key,
    required this.stateRendererType,
    String? message,
    String? title,
    required this.actionFunction,
    this.textButton,
    this.closeDialogFunction,
  })  : message = message ?? StringResMain.loadingTitle.tr(),
        title = title ?? Constant.empty;

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.popupLoadingState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppAnimAssets.loading),
          _getMessage(message),
        ]);
      case StateRendererType.popupErrorState:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppAnimAssets.error),
          _getMessage(message),
          _getActionButton(StringResMain.closeTitle.tr(), context)
        ]);
      case StateRendererType.fullscreenSuccessState:
        return _getItemsInColumn([
          _getAnimatedImage(AppAnimAssets.success),
          _getMessage(message),
          _getActionButton(StringResMain.closeTitle.tr(), context)
        ]);
      case StateRendererType.popupSuccess:
        return _getPopUpDialog(context, [
          _getAnimatedImage(AppAnimAssets.success),
          _getMessage(title),
          _getMessage(message),
          _getActionButton(StringResMain.closeTitle.tr(), context)
        ]);
      case StateRendererType.fullscreenLoadingState:
        return _getItemsInColumn([
          _getAnimatedImage(AppAnimAssets.loading),
          _getMessage(message),
        ]);
      case StateRendererType.fullscreenErrorState:
        return _getItemsInColumn([
          _getAnimatedImage(AppAnimAssets.error),
          _getMessage(message),
          _getActionButton(
              textButton ?? StringResMain.tryAgainTitle.tr(), context)
        ]);
      case StateRendererType.contentScreenState:
        return Container();
      case StateRendererType.emptyScreenState:
        return _getItemsInColumn(
            [_getAnimatedImage(AppAnimAssets.empty), _getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      elevation: 1.5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorRes.primary,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8.0,
                offset: Offset(0, 12),
              )
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: 100,
      width: 100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message, {bool isSnackbar = false}) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: AppText.bold(
          message,
          color: isSnackbar ? ColorRes.secondary : ColorRes.textColorDark,
          textAlign: TextAlign.center,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }

  Widget _getActionButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: 180,
          child: AppFilledButton(
            onTap: () {
              if (stateRendererType == StateRendererType.fullscreenErrorState ||
                  stateRendererType ==
                      StateRendererType.fullscreenSuccessState) {
                actionFunction
                    ?.call(); // to call the API function again to retrys
              } else {
                Navigator.of(context)
                    .pop(); // popup state error so we need to dismiss the dialog
                closeDialogFunction?.call();
              }
            },
            text: buttonTitle,
            color: ColorRes.third,
          ),
        ),
      ),
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
