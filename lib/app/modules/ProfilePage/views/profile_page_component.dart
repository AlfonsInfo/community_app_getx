part of 'profile_page_view.dart';

extension ProfileImageSection on ProfilePageView {
  Stack profileImageSection(bool isUseCover, BuildContext context) {
    return Stack(
      children: [ 
        profileCover(isUseCover, context),
        profileImage(),
        // photoProfileFetch(),
        changeCoversButton()
      ],
    );
  }

  Positioned profileImage() {
    return Positioned(
      width: 100.w,
      bottom: 0.h,
      child: Center(
        child: SizedBox(
          width: 20.w,
          height: 15.h,
          // child: profileNetworkCacheImage()
          child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: photoProfileFetch(),
            )
          ),
      ),
    );
  }

  Widget profileCover(bool isUseCover, BuildContext context) {
    return (isUseCover)
        ? covers(context)
        : placeHolderCovers(context);
  }
Widget photoProfileFetch()
{
  return FutureBuilder(
    future: controller.getPhotoProfile(),
    builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState.done)
      {
        var data = snapshot.data! as dio.Response<List<int>>? ;
        controller.currentPhotoProfile.value = data!.data!;
           return Obx(
             () => Image.memory(
              Uint8List.fromList(controller.currentPhotoProfile.value!)
              ,fit: BoxFit.fill,),
           );
      } else {
        return const Center(child: CircularProgressIndicator(),);
        // return Skeletonizer(child: Image.asset(ImageAssetPaths.dummyUser));
      }
    },); 
}
}


Padding covers(BuildContext context) {
  return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 1 / 4,
              child: Image(
                image: const AssetImage('assets/images/cover/cover_4.jpg'),
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if(wasSynchronouslyLoaded){
                    return child;
                  }else{
                    return  FadeTransition(opacity: const  AlwaysStoppedAnimation<double>(5),
                    child: child,
                    );
                  }
                },
                fit: BoxFit.fill,
                // ignore: dead_code
              )),
        );
}

CachedNetworkImage profileNetworkCacheImage() {
  return CachedNetworkImage(
            imageUrl: '${ApiConstant.prefixEndpoint}${EndPoint.photoProfile}',
            httpHeaders: Get.find<MainAppController>().headers,
            fadeInDuration: Duration.zero,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator.adaptive()),
  );
}

// Positioned changeProfileButton() {
//   return Positioned(
//       width: 135.w,
//       bottom: 0,
//       child: FloatingActionButton(
//           child: const Icon(Icons.update),
//           onPressed: () {
//             showCoversOption();
//           }));
// }
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
        leading: IconConstant.person,
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
          Padding(
            padding: EdgeInsets.only(bottom: 2.h ,top: 2.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () => controller.navigateToUpdateProfile()
                    ,child: Text(AppLocalizations.of(Get.context!).update_profile)),
                ElevatedButton(
                    onPressed: () {}, child: Text((AppLocalizations.of(Get.context!).change_password)),) 
                    ],
            ),
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

