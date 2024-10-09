import 'package:todo_app/core/app_library.dart';

class CreateCategoryWidget extends HookWidget {
  final String title;

  const CreateCategoryWidget({this.title = '', super.key});

  String get _firstWord => title.isEmpty ? '' : title.split(' ').first;

  String get _title => "Create ${_firstWord.isEmpty ? 'Category' : '$_firstWord Category'}";

  String get _btnTxt => "Create ${_firstWord.isEmpty ? 'Category' : _firstWord}";

  String get _inputTxt => "Enter ${_firstWord.isEmpty ? 'Category' : '$_firstWord Category'} Name:";

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
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
  }

  Widget _buildCreateButton(TextEditingController controller, BuildContext context) {
    return CustomButton(
      data: _btnTxt,
      onTap: () async {
        final inputText = controller.text;
        toast('Created: $inputText');
        controller.clear();
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController();

    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: boxDecorationWithRoundedCorners(borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0))),
      child: AnimatedScrollView(
        padding: EdgeInsets.only(bottom: keyboardHeight),
        listAnimationType: ListAnimationType.None,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildHeader(context),
          ContentWidget(title: _inputTxt, controller: textController),
          const SizedBox(height: 16),
          if (keyboardHeight == 0) _buildCreateButton(textController, context),
        ],
      ),
    );
  }
}
