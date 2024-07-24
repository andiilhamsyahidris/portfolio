import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/app/app_constant.dart';
import 'package:portfolio/presentation/base/state_renderer.dart';
import 'package:portfolio/presentation/base/state_renderer_impl.dart';
import 'package:portfolio/presentation/resources/color_res.dart';
import 'package:portfolio/presentation/resources/language_res.dart';
import 'package:portfolio/presentation/resources/string_res.dart';
import 'package:portfolio/presentation/widgets/app_text.dart';

extension FlexExpandExtension on Widget {
  Widget onFlexible() => Flexible(child: this);
  Widget onExpanded() => Expanded(child: this);
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
}

extension PaddingExtension on Widget {
  Widget padAll(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
  Widget padSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );

  Widget padOnly(
          {double top = 0.0,
          double left = 0.0,
          double bottom = 0.0,
          double right = 0.0}) =>
      Padding(
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );
}

extension MarginExtension on Widget {
  Widget marginAll(double value) => Container(
        margin: EdgeInsets.all(value),
        child: this,
      );
  Widget marginSymmetric({double vertical = 0.0, double horizontal = 0.0}) =>
      Container(
        margin:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        child: this,
      );
  Widget marginOnly(
          {double top = 0.0,
          double left = 0.0,
          double bottom = 0.0,
          double right = 0.0}) =>
      Container(
        margin:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this,
      );
}

extension VisibleExtension on Widget {
  Widget visible(bool isVisible) => isVisible ? this : const SizedBox.shrink();
}

extension BorderExtension on Widget {
  Widget withBorder({Color color = ColorRes.third, double width = 1.0}) =>
      Container(
        decoration:
            BoxDecoration(border: Border.all(color: color, width: width)),
      );
}

extension BorderRadiusExtension on Widget {
  Widget borderRadiusAll(double value) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(value))),
        child: this,
      );

  Widget borderRadiusVertical({double top = 0.0, double bottom = 0.0}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
          top: Radius.circular(top),
          bottom: Radius.circular(bottom),
        )),
        child: this,
      );

  Widget borderRadiusHorizontal({double left = 0.0, double right = 0.0}) =>
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(
          left: Radius.circular(left),
          right: Radius.circular(right),
        )),
        child: this,
      );

  Widget borderRadiusOnly(
          {double topLeft = 0.0,
          double topRight = 0.0,
          double bottomLeft = 0.0,
          double bottomRight = 0.0}) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(topLeft),
              topRight: Radius.circular(topRight),
              bottomLeft: Radius.circular(bottomLeft),
              bottomRight: Radius.circular(bottomRight)),
        ),
        child: this,
      );
}

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.bahasa:
        return bahasa;
      case LanguageType.english:
        return english;
    }
  }
}

extension SnackbarExtension on BuildContext {
  void showAppSnackbar(BuildContext context, IconData icon, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorRes.third,
          content: Row(
            children: [
              Icon(
                icon,
                color: ColorRes.secondary,
              ).padAll(8.0),
              AppText(
                message,
                color: ColorRes.secondary,
              ),
            ],
          ),
        ),
      );
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context, Widget contentScreenWidget, Function actionFunction,
      {Function? closeDialogFunction}) {
    switch (runtimeType) {
      case const (LoadingState):
        {
          if (getStateRendererType() == StateRendererType.popupLoadingState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage(),
                closeDialogFunction: closeDialogFunction);
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_LOADING_STATE
          {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                actionFunction: actionFunction);
          }
        }
      case const (ErrorState):
        {
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupErrorState) {
            // showing popup dialog
            showPopUp(context, getStateRendererType(), getMessage(),
                closeDialogFunction:
                    (this as ErrorState).onCloseDialogFunction ??
                        closeDialogFunction);
            // return the content ui of the screen
            return contentScreenWidget;
          } else // StateRendererType.FULL_SCREEN_ERROR_STATE
          {
            return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              actionFunction:
                  (this as ErrorState).onCloseDialogFunction ?? actionFunction,
              textButton: (this as ErrorState).textButton,
            );
          }
        }

      case const (ContentState):
        {
          if ((this as ContentState).dismissDialog) {
            dismissDialog(context);
          }
          return contentScreenWidget;
        }
      case const (EmptyState):
        {
          return StateRenderer(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              actionFunction: actionFunction);
        }
      case const (SuccessState):
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          dismissDialog(context);
          if (getStateRendererType() == StateRendererType.popupSuccess) {
            // show popup
            showPopUp(context, StateRendererType.popupSuccess, getMessage(),
                title: StringResMain.successTitle.tr(),
                closeDialogFunction: (this as SuccessState).onSuccessFunction);
            // return content ui of the screen
            return contentScreenWidget;
          } else {
            return StateRenderer(
                stateRendererType: getStateRendererType(),
                message: getMessage(),
                actionFunction: (this as SuccessState).onSuccessFunction);
          }
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = Constant.empty,
      Function? closeDialogFunction,
      int? progress}) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
              stateRendererType: stateRendererType,
              message: message,
              title: title,
              actionFunction: () {},
              closeDialogFunction: closeDialogFunction,
            )).then((value) => {
          closeDialogFunction?.call(),
        }));
  }
}
