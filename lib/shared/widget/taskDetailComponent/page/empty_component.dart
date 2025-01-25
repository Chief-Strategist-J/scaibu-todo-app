import 'package:todo_app/core/app_library.dart';

/// Doc Required
class EmptyComponent<T> extends StatelessWidget {
  /// Doc Required
  const EmptyComponent({required final EmptyEntityModel<T> model, super.key})
      : _model = model;
  final EmptyEntityModel<T> _model;

  void _onCloseTap(final BuildContext context) {
    GoRouter.of(context).pop();
  }

  @override
  Widget build(final BuildContext context) => Container(
        width: context.width(),
        alignment: Alignment.center,
        decoration: boxDecorationWithRoundedCorners(
          backgroundColor: context.primaryColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
        ),
        child: Column(
          children: <Widget>[
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    _onCloseTap(context);
                  },
                ),
                16.width,
              ],
            ),
            const Spacer(),
            CreateComponent<T>(model: _model),
            const Spacer(),
          ],
        ),
      );
}

/// Doc Required
class CreateComponent<T> extends StatelessWidget {
  /// Doc Required
  const CreateComponent({
    required final EmptyEntityModel<T> model,
    super.key,
  }) : _model = model;
  final EmptyEntityModel<T> _model;

  @override
  Widget build(final BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            _model.emptyMessage,
            style: boldTextStyle(size: 16),
            textAlign: TextAlign.center,
          ),
          16.height,
          SizedBox(
            width: context.width() * 0.5,
            child: CustomButton(data: _model.button, onTap: _model.onCreateTap),
          ),
        ],
      );
}
