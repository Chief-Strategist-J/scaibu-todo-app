import 'package:todo_app/core/app_library.dart';
/// Doc Required
class CreateTagPage extends StatelessWidget {
  /// Doc Required
  CreateTagPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _onClose(final BuildContext context) {
    GoRouter.of(context).pop();
  }

  void _onAddTag(final BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<TagBloc>().add(CreateTagEvent());
    }
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Add New Tag', style: boldTextStyle(size: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _onClose(context);
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
          children: <Widget>[
            Form(
              key: _formKey,
            child: AnimatedScrollView(
              padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
                children: <Widget>[
                  const TagInputField(),
                  8.height,
                const ColorPickerComponent(),
              ],
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: TagButtonComponent(
              onTapOfCancel: () {
                _onClose(context);
              },
              onTapOfAdd: () {
                _onAddTag(context);
              },
            ),
          ),
        ],
      ),
    );
}
