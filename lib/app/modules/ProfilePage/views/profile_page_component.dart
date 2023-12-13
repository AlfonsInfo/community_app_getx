part of 'profile_page_view.dart';

extension ProfileImageSection on ProfilePageView {
  Stack profileImageSection(bool isUseCover, BuildContext context) {
    return Stack(
      children: [
        profileCover(isUseCover, context),
        profileImage(),
        changeCoversButton()
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
                child: Image(
                  image: const AssetImage('assets/images/cover/cover_4.jpg'),
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Skeletonizer(child: placeHolderCovers(context));
                    }
                  },
                  fit: BoxFit.fill,
                  // ignore: dead_code
                )),
          )
        : placeHolderCovers(context);
  }
}

Positioned changeCoversButton() {
  return Positioned(
      bottom: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
            child: const Icon(FontAwesomeIcons.brush),
            onPressed: () {
              showCoversOption();
            }),
      ));
}

Container placeHolderCovers(BuildContext context) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height * 1 / 4,
    color: Colors.grey,
  );
}

void showCoversOption() {
  Get.bottomSheet(Container(
    height: 200,
    color: Colors.white,
    child: const Text("test"),
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
          Obx(
            () => Skeletonizer(
              enabled: controller.isLoadingProfileData.isTrue,
              child: Center(
                child: Table(
                  columnWidths: const {
                    0: FlexColumnWidth(3),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(4),
                  },
                  children: [
                    profileDetailRow(
                        AppLocalizations.of(Get.context!).full_name,
                        controller.userProfile.fullname),
                    profileDetailRow(AppLocalizations.of(Get.context!).username,
                        controller.userProfile.username),
                    profileDetailRow(AppLocalizations.of(Get.context!).email,
                        controller.userProfile.email),
                  ],
                ),
              ),
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

