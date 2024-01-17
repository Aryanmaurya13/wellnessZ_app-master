
import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:get/get.dart';

import 'package:dynamicutils/Size/dynamicutils.dart';
import 'dart:io';


import '../../resources/colors/app_colors.dart';
import '../../resources/styles/text_styles/text_styles.dart';
import '../loaders & dialogs/loaders.dart';
import '../tools/debug_tools/debug_tools.dart';

class MediaGrid extends StatefulWidget {
  const MediaGrid({super.key});

  @override
  State<MediaGrid> createState() => _MediaGridState();
}
class _MediaGridState extends State<MediaGrid> {
  CustomGalleryController controller = Get.put(CustomGalleryController());
  DynamicSize size = DynamicSize(896,414);
  final FilterOptionGroup _filterOptionGroup = FilterOptionGroup(
      imageOption: const FilterOption(
        sizeConstraint: SizeConstraint(ignoreSize: true),
      ),
      videoOption: const FilterOption(
          durationConstraint: DurationConstraint(max: Duration.zero)
      )
  );
  final int _sizePerPage = 50;

  AssetPathEntity? _path;
  List<AssetEntity>? _entities;

  int _totalEntitiesCount = 0;
  ScrollController scrollController = ScrollController();
  int _page = 0;
  bool _isLoading = false;
  bool _isLoadingMore = false;
  bool _hasMoreToLoad = true;
  void addFileToList(List<AssetEntity>? entities, String filePath) async {
    entities ??= [];

    // Check if the file already exists in the list to avoid duplicates
    if (entities.any((asset) => asset.id == filePath)) {
      print('File already exists in the list.');
      return;
    }
    setState(() {
      entities?.add(AssetEntity(id: filePath, typeInt: 1, width: 200, height: 200));
    });
    await Future.delayed(const Duration(seconds: 2)); //
    // Replace this with your own AssetEntity constructor
    print('File added to the list.');
  }

  void onImageClick(int index){
    if(controller.selectedImages.contains(_entities![index])){
      controller.selectedImages.remove(_entities![index]);
    }
    else if(controller.selectedImages.length==controller.numberOfImages){
     // Toast.errorToast(message: "You Can Select only upto ${controller.numberOfImages} images");
      return;
    }
    else {
      controller.selectedImages.add(_entities![index]);
    }
    controller.selectedImages.refresh();
  }

  Future<void> requestAssets() async {
    setState(() {
      _isLoading = true;
    });
    // Request permissions.
    final PermissionState ps = await PhotoManager.requestPermissionExtend();
    if (!mounted) {
      return;
    }
    if (ps.isAuth) {
      // Granted.
    } else{
      Get.defaultDialog(title: "Permission Required",
        contentPadding: const EdgeInsets.all(20),
        titleStyle: AppTextStyle.lBold.copyWith(color: AppColor.whiteColor,fontSize: 22),
        middleTextStyle:  AppTextStyle.lBold.copyWith(color: AppColor.blackColor,fontSize: 16),
        backgroundColor: AppColor.whiteColor,
        middleText: "Please Ask From Permission From Your Device",
        buttonColor: AppColor.lightGreen,
        textConfirm: "OK",
        confirmTextColor: AppColor.lightGreen,
        onConfirm: ()=>requestAssets(),
      );
    }
    if (!ps.hasAccess) {
      setState(() {
        _isLoading = false;
      });
      kDebugPrint('Permission is not accessible.');
      return;
    }


    // Obtain assets using the path entity.
    final List<AssetPathEntity> paths = await PhotoManager.getAssetPathList(
      onlyAll: true,
      filterOption: _filterOptionGroup,
    );
    if (!mounted) {
      return;
    }
    // Return if not paths found.
    if (paths.isEmpty) {
      setState(() {
        _isLoading = false;
      });
      kDebugPrint('No paths found.');
      return;
    }
    setState(() {
      _path = paths.first;
    });
    _totalEntitiesCount = await _path!.assetCountAsync;
    final List<AssetEntity> entities = await _path!.getAssetListPaged(
      page: 0,
      size: _sizePerPage,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _entities = entities;
      _isLoading = false;
      _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
    });
  }

  Future<void> _loadMoreAsset() async {
    final List<AssetEntity> entities = await _path!.getAssetListPaged(
      page: _page + 1,
      size: _sizePerPage,
    );
    if (!mounted) {
      return;
    }
    setState(() {
      _entities!.addAll(entities);
      _page++;
      _hasMoreToLoad = _entities!.length < _totalEntitiesCount;
      _isLoadingMore = false;
    });
  }

  Widget _buildBody(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }
    if (_path == null) {
      return const Center(child: Text('Request paths first.'));
    }
    if (_entities?.isNotEmpty != true) {
      return const Center(child: Text('No assets found on this device.'));
    }
    return GridView.builder(
        controller: scrollController,
        itemCount: _entities?.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {

          return FutureBuilder(
            future: _entities?[index].thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (BuildContext context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if(index == 0) {
                  return InkWell(
                    onTap: ()async{
                      await controller.onCameraClick();
                    },
                    child: Container(
                      margin: EdgeInsets.all(size.width(6)),
                      width: size.width(117),
                      height: size.height(112),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: AppColor.whiteColor,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.camera_alt, color: AppColor.darkGreen,size: 35,),
                            SizedBox(height: size.height(5),),
                            Text("From Camera", style: AppTextStyle.lBold.copyWith(fontSize: 14,color: AppColor.darkGreen),)
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Obx(() => InkWell(
                  onTap:()=> onImageClick(index),
                  child: controller.selectedImages.contains(_entities?[index])?
                  Container(
                    margin: EdgeInsets.all(size.width(6)),
                    width: size.width(117),
                    height: size.height(112),
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: AppColor.mediumGreen,
                    ),
                    child: Container(
                      width: size.width(37),
                      height: size.height(37),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.blackColor
                      ),
                      child: Text((controller.selectedImages.indexOf(_entities![index])+1).toString(),style: AppTextStyle.lRegular.copyWith(color: AppColor.whiteColor,fontSize: 14),),
                    ),
                  ):
                  Container(
                    margin: EdgeInsets.all(size.width(6)),
                    width: size.width(117),
                    height: size.height(112),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5))
                    ),
                    child: Image.memory(
                      snapshot.data!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ));
              }return Container();
            },
          );
        });
  }

  @override
  void initState() {
    requestAssets();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent) {
        _loadMoreAsset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.whiteColor,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          toolbarHeight: size.height(100),
          centerTitle: true,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: EdgeInsets.symmetric(vertical: size.height(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      // color: AppColor.whiteColor,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back,color: AppColor.blackColor,size: 33,),
                      onPressed: (){Get.back();},
                    ),
                  ),
                ),
                Expanded(
                  flex: 13,
                  child: Padding(
                      padding: EdgeInsets.only(bottom: size.height(7)),
                      child: Obx(()=>RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(text: "${controller.selectedImages.length??"0"}/${controller.numberOfImages} ", style: AppTextStyle.lRegular.copyWith(fontSize: 24),children: [
                          TextSpan(text: "Images",style: AppTextStyle.lRegular.copyWith(color: AppColor.blackColor,fontSize: 16))
                        ]),
                      ),)
                  ),
                ),
                Expanded(
                  flex:5,
                  child: InkWell(
                    onTap: controller.imagePicker,
                    child: Container(
                      margin: EdgeInsets.only(bottom: size.height(8)),
                      child: Row(
                        children: [
                          Container(
                            width: size.width(47),
                            height: size.height(20),
                            alignment: Alignment.center,
                            child:
                            Text("Album",
                              style:AppTextStyle.lRegular.copyWith(fontSize: 12, color: AppColor.lightGreen),
                            ),
                          ),
                          Container(
                            width: size.width(20),
                            height: size.height(20),
                            padding: const EdgeInsets.all(6),
                            child: const Icon(Icons.arrow_drop_down)
                            // const Image(
                            //   image: AssetImage(ImagePath.dropdown),
                            //   fit: BoxFit.contain,
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height(55),
              color: AppColor.lightGreen,
              alignment: Alignment.center,
              child: Text(
                "Choose Images",
                style: AppTextStyle.lRegular.copyWith(fontSize: 18),
              ),
            ),
            Expanded(child: Padding(
              padding: EdgeInsets.symmetric(horizontal:size.width(19),vertical: size.height(4)),
              child: _buildBody(context),
            )),
          ],
        ),

        floatingActionButton: Obx(()=>
        controller.selectedImages.isNotEmpty?
        // WideButton(text: 'Upload', onPressed: (){
        //   controller.onClick();
        // },height: size.height(65),leftMargin: size.width(19),rightMargin: size.width(19),):
            Container():Container()
        )
    );
  }
}


class CustomGallery{

  Future<List<int>> compressImage(File imageFile, {int targetSize = 200}) async {
    var fileSize = imageFile.lengthSync() / 1024;
    if (fileSize <= targetSize) {
      return imageFile.readAsBytes();
    }

    var quality = 90;
    var compressedData = await FlutterImageCompress.compressWithFile(
      imageFile.absolute.path,
      quality: quality,
    );

    while (compressedData!.length / 1024 > targetSize && quality > 0) {
      quality -= 10;
      compressedData = await FlutterImageCompress.compressWithFile(
        imageFile.absolute.path,
        quality: quality,
      );
    }

    return compressedData;
  }
  CustomGalleryController controller = Get.put(CustomGalleryController());

  Future<List<File>> galleryPicker(int numberOfImages) async {
    controller.numberOfImages = numberOfImages;
    await Get.bottomSheet(const MediaGrid()
      ,backgroundColor: AppColor.whiteColor,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
          )
      ),
    );
    List<File> compressedImages = [];
    List<File> selectedImages = controller.rxList.value;
    if(numberOfImages==1){
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: selectedImages[0].path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,

        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '',
              // toolbarColor: AppColors.black,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.ratio4x3,
              lockAspectRatio: false),
          IOSUiSettings(
            title: '',
          ),
          WebUiSettings(
            context: Get.context!,
          ),
        ],
      );
      if(croppedFile!=null){
        selectedImages.clear();
        selectedImages.add(File(croppedFile.path));
      }

    }
    Get.delete<CustomGalleryController>(force: true);

    Directory appDir = await getApplicationDocumentsDirectory();
    kDebugPrint(selectedImages);
    for (var imageFile in selectedImages) {
      List<int> compressedImageData = await compressImage(imageFile);
      String compressedImagePath = "${appDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg";
      File compressedImageFile = File(compressedImagePath);
      await compressedImageFile.writeAsBytes(compressedImageData);
      compressedImages.add(compressedImageFile);
    }

    return compressedImages;
  }
}

class CustomGalleryController extends GetxController{

  CustomGalleryController();
  int numberOfImages =0;
  RxList selectedImages = [].obs;
  List<File> fileList = [];
  RxList<File> rxList= [File("")].obs;

  // @override
  // void onInit() {
  //   rxList.clear();
  //   super.onInit();
  // }


  void imagePicker()async{
    final picker = ImagePicker();
    final pickedImage = await picker.pickMultipleMedia();
    rxList.clear();
    for(int i =0; i<pickedImage.length; i++){
      rxList.add(File(pickedImage[i].path));
    }
    kDebugPrint(rxList);
    if(rxList.length>numberOfImages){
      rxList.removeRange(numberOfImages, rxList.length);
    }
    rxList.refresh();
    Get.back();
  }

  Future onCameraClick()async{
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if(pickedImage!=null){
      rxList.clear();
      File file = File(pickedImage.path);
      rxList.add(file);
      Get.back();
      return file;
    }else{
      return File("");
    }
  }

  bool _isUpload = false;

  Future<List<File>> _forLoop() async {
    showLoadingDialog();
    for(AssetEntity entity in selectedImages){
      File? file = await entity.file;
      fileList.add(file!);
    }
    await Future.delayed(const Duration(milliseconds: 500));
    return fileList;
  }

  void onClick()async{
    if(rxList.value.length<=numberOfImages) {
      var temp = await _forLoop();
      rxList.clear();
      _isUpload = true;
      rxList.addAll(temp);
      rxList.refresh();
      hideLoadingDialog();
      Get.back();
    }else{
      Get.back();
    }
  }
}