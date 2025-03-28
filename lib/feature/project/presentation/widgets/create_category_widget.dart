import 'package:todo_app/core/app_library.dart';

/// Doc Required
class CreateCategoryWidget extends HookWidget {
  /// Doc Required
  const CreateCategoryWidget({this.title = '', super.key});

  /// Doc Required
  final String title;

  String get _firstWord => title.isEmpty ? '' : title.split(' ').first;

  String get _title =>
      "Create ${_firstWord.isEmpty ? 'Category' : '$_firstWord Category'}";

  String get _btnTxt =>
      "Create ${_firstWord.isEmpty ? 'Category' : _firstWord}";

  String get _inputTxt =>
      "Enter ${_firstWord.isEmpty ? 'Category' : '$_firstWord Category'} Name:";

  Widget _buildHeader(final BuildContext context) => Row(
        children: <Widget>[
          const Spacer(),
          Text(_title, style: boldTextStyle(size: 20)),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );

  Widget _buildCreateButton(
    final TextEditingController controller,
    final BuildContext context,
  ) =>
      CustomButton(
        data: _btnTxt,
        onTap: () async {
          final String inputText = controller.text;
          toast('Created: $inputText');
          controller.clear();
          Navigator.pop(context);
        },
      );

  @override
  Widget build(final BuildContext context) {
    final TextEditingController textController = useTextEditingController();

    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: AnimatedScrollView(
        padding: EdgeInsets.only(bottom: keyboardHeight),
        listAnimationType: ListAnimationType.None,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildHeader(context),
          ContentWidget(title: _inputTxt, controller: textController),
          const SizedBox(height: 16),
          if (keyboardHeight == 0) _buildCreateButton(textController, context),
        ],
      ),
    );
  }
}
