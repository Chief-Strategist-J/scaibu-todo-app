import 'package:todo_app/core/app_library.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  String get getEmail => userCredentials.getUserEmail
      .validate()
      .capitalizeFirstLetter()
      .splitBefore('@');

  String get getUserImage => userCredentials.getFirebasePhotoUrl.validate();

  Future<void> _onTapOfMenu(final BuildContext context) async {
    await GoRouter.of(context).push(ApplicationPaths.forgetPasswordPage);
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () async {
                await _onTapOfMenu(context);
              },
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  <Widget>[
                    56.height,
                    if (getUserImage.isNotEmpty)
                      Image.network(getUserImage, width: 75, height: 75)
                    else
                      const CircleAvatar(radius: 75),
                    24.height,
                    if (userCredentials.getFirstName.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'First Name',
                          value: userCredentials.getFirstName.validate()),
                    if (userCredentials.getLastName.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Last Name',
                          value: userCredentials.getLastName.validate()),
                    if (getEmail.validate().isNotEmpty)
                      KeyAndValue(label: 'Email', value: getEmail.validate()),
                    if (userCredentials.getPhone.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Phone',
                          value: userCredentials.getPhone.validate()),
                    if (userCredentials.getBirthDate.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Birth Date',
                          value: userCredentials.getBirthDate.validate()),
                    if (userCredentials.getBio.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Bio',
                          value: userCredentials.getBio.validate()),
                    if (userCredentials.getAddress.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Address',
                          value: userCredentials.getAddress.validate()),
                    if (userCredentials.getCity.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'City',
                          value: userCredentials.getCity.validate()),
                    if (userCredentials.getState.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'State',
                          value: userCredentials.getState.validate()),
                    if (userCredentials.getCountry.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Country',
                          value: userCredentials.getCountry.validate()),
                    if (userCredentials.getZipCode.validate().isNotEmpty)
                      KeyAndValue(
                          label: 'Zip-Code',
                          value: userCredentials.getZipCode.validate()),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}

class KeyAndValue extends StatelessWidget {
  const KeyAndValue({required this.label, required this.value, super.key});
  final String label;
  final String value;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 24),
        child: AppTextField(
          textFieldType: TextFieldType.NAME,
          controller: TextEditingController(text: value),
          textStyle: boldTextStyle(),
          decoration: InputDecoration(
            label: Text('$label : ',
                style: boldTextStyle(size: 12, color: context.cardColor)),
          ),
        ),
      );
}
