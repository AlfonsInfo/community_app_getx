part of 'profile_page_view.dart';

extension ProfileImageSection on ProfilePageView {
  Stack profileImageSection(bool isUseCover, BuildContext context) {
    return Stack(
      children: [
        profileCover(isUseCover, context),
        profileImage(),
        Positioned(
          bottom: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(child: const Icon(FontAwesomeIcons.brush),onPressed: (){
              showCoversOption();
            }),
          ))
      ],
    );
  }

  Positioned profileImage() {
    return Positioned(
      width: 400,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              'assets/images/itbca.jpg',
            )),
      ),
    );
  }

  Widget profileCover(bool isUseCover, BuildContext context) {
    return (isUseCover)
        ? Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1 / 4,
                child: Image.asset(
                  'assets/images/cover/cover_4.jpg',
                  fit: BoxFit.fill,
                  // ignore: dead_code
                )),
          )
        : Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 1 / 4,
            color: Colors.grey,
          );
  }
}

void showCoversOption() {
  Get.bottomSheet(Container(
    height: 200,
    color: Colors.white,
    child: Text("test"),
  ));
}

extension MyProfileSection on ProfilePageView {
  Card myProfileSection(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(AppLocalizations.of(context).my_profile),
        leading: const Icon(Icons.person),
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(3),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(4),
              },
              children: [
                profileDetailRow(AppLocalizations.of(Get.context!).full_name,
                    DumyData.loginUser.fullName),
                profileDetailRow(AppLocalizations.of(Get.context!).username,
                    DumyData.loginUser.username),
                profileDetailRow(AppLocalizations.of(Get.context!).email,
                    DumyData.loginUser.email),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () {}, child: const Text("Update Profile")),
              ElevatedButton(
                  onPressed: () {}, child: const Text("Change Password")),
            ],
          )
        ],
      ),
    );
  }

  TableRow profileDetailRow(keyField, value) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(keyField),
          ),
        ),
        const TableCell(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(':'),
          ),
        ),
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}

extension PreferencesSetting on ProfilePageView {
  Card preferences(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(prefixLocalizations.preferences),
        leading: const Icon(Icons.settings),
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefixLocalizations.preferences_theme),
                Obx(() => Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: IconButton(onPressed: () => mainAppController.toggleThemeMode(), icon: mainAppController.defaultThemeMode.value == ThemeMode.dark ? const Icon(Icons.dark_mode) : const Icon(Icons.light_mode)),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefixLocalizations.preferences_language),
                toggleLanguage(AppLocalizations.of(context), context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Obx toggleLanguage(
      AppLocalizations prefixLocalizations, BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(prefixLocalizations.language),
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Switch(
                    onChanged: (bool value) {
                      mainAppController.setLanguage(controller.isIndoLanguageToggle);
                      controller.toggleLanguage();
                    },
                    inactiveThumbColor: Colors.grey,
                    value: controller.isIndoLanguageToggle.value,
                    activeThumbImage: Image.asset(
                      ImageAssetPaths.indonesianFlag,
                      fit: BoxFit.fitHeight,
                    ).image,
                    inactiveThumbImage: Image.asset(
                      ImageAssetPaths.englishFlag,
                      fit: BoxFit.fitHeight,
                    ).image,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
