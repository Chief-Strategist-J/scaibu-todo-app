import 'package:todo_app/core/app_library.dart';

class EmptyComponent<T> extends StatelessWidget {
  final EmptyEntityModel<T> _model;

  const EmptyComponent({super.key, required EmptyEntityModel<T> model}) : _model = model;

  void onCloseTap(BuildContext context) {
    GoRouter.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          16.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  onCloseTap(context);
                },
              ),
              16.width,
            ],
          ),
          const Spacer(),
          CreateComponent<T>(model: _model),
          const Spacer()
        ],
      ),
    );
  }
}

class CreateComponent<T> extends StatelessWidget {
  final EmptyEntityModel<T> _model;

  const CreateComponent({
    super.key,
    required EmptyEntityModel<T> model,
  }) : _model = model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(_model.title, style: boldTextStyle(size: 16), textAlign: TextAlign.center),
        16.height,
        SizedBox(
          width: context.width() * 0.5,
          child: CustomButton(data: _model.button, onTap: _model.onCreateTap),
        )
      ],
    );
  }
}
