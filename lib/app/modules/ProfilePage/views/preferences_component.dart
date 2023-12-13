part of 'profile_page_view.dart';

extension PreferencesSetting on ProfilePageView {
  Card preferences(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(prefixLocalizations.preferences),
        leading: const Icon(Icons.settings),
        expandedAlignment: Alignment.topLeft,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* pilihan save tema dan pilihan bahasa secara lokal ?
          //* Delete setingan bahasa dan tema lokal ?
          themeBySystem(),
           Obx((){
             return mainAppController.isThemeModeBySistem.isTrue ?  Container() : themeSwitch();
           }
          ),
           Obx((){
             return mainAppController.isThemeModeBySistem.isTrue ?  Container() : languageSwitch();
           }
          )
            ,
          savePreferenceButton()
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
                      mainAppController
                          .setLanguage(controller.isIndoLanguageToggle);
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

   Padding themeBySystem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prefixLocalizations.theme_base_on_system),
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: InkWell(
                        child: Switch(
                          onChanged: (bool value) {
                            mainAppController.isThemeModeBySistem.value = value;
                          },
                          inactiveThumbColor: Colors.grey,
                          value: mainAppController.isThemeModeBySistem.value,
                        ),
                      ),
            ),
          ),
        ],
      ),
    );
  }

  Padding themeSwitch() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prefixLocalizations.preferences_theme),
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: IconButton(
                    onPressed: () => mainAppController.toggleThemeMode(),
                    icon: mainAppController.defaultThemeMode.value ==
                            ThemeMode.dark
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode)),
              )),
        ],
      ),
    );
  }

  Padding languageSwitch() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(prefixLocalizations.preferences_language),
          toggleLanguage(AppLocalizations.of(Get.context!), Get.context!)
        ],
      ),
    );
  }

  Center savePreferenceButton() {
    return Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 2.h ,top: 2.h),
          child: ElevatedButton(
              onPressed: () {
                dialogSavePreference();
              },
              child: Text(
                AppLocalizations.of(Get.context!).preferences_save,
              )),
        ));
  }

  Future<dynamic> dialogSavePreference() {
    return Get.dialog(AlertDialog(
        title: Center(
          child: Text(AppLocalizations.of(Get.context!).preferences_save),
        ),
        content: SizedBox(
          height: 200,
          child: Column(children: [
            Obx(() {
              return DropdownMenu<PreferenceSaveOption>(
                initialSelection: controller.preferencesOption[0],
                controller: dropDownPreferencesSavingController,
                dropdownMenuEntries: controller.preferencesOption
                    .map<DropdownMenuEntry<PreferenceSaveOption>>((e) =>
                        DropdownMenuEntry(
                            value: e,
                            label: controller.isIndoLanguageToggle.value
                                ? e.nameIndo!
                                : e.nameEng!))
                    .toList(),
                onSelected: (value) =>
                    controller.preferenceSelectedSavingMethod.value = value!,
              );
            }),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Center(
                  child: Obx(() => Text(
                      controller.isIndoLanguageToggle.value
                          ? controller.preferenceSelectedSavingMethod.value
                                  .descriptionIndo ??
                              ""
                          : controller.preferenceSelectedSavingMethod.value
                                  .descriptionEng ??
                              "",
                      textAlign: TextAlign.justify))),
            ),
            ElevatedButton(
                onPressed: (){
                  controller.savePreference();
                  Get.back();
                },
                child: Text(AppLocalizations.of(Get.context!).save))
          ]),
        )));
  }
}
