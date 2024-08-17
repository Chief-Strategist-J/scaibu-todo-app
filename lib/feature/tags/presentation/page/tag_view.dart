import 'package:todo_app/core/app_library.dart';


class CreateTagPage extends StatelessWidget {

  const CreateTagPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<TagBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Tag", style: boldTextStyle(size: 16)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(bottom: 16, left: 16, right: 16, child: TagButtonComponent()),
          AnimatedScrollView(
            padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
            children: [
              const TagInputField(),
              8.height,
              const ColorPickerComponent(),
            ],
          ),
        ],
      ),
    );
  }
}
