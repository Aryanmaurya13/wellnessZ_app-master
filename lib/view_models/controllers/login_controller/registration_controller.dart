import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wellnessz_app/repository/login_repo/login_repository.dart';
import 'package:wellnessz_app/resources/routes/route_names.dart';
import 'package:wellnessz_app/utils/loaders%20&%20dialogs/dialogs.dart';
import 'package:wellnessz_app/utils/tools/debug_tools/debug_tools.dart';
import 'package:wellnessz_app/utils/tools/snackbars/snackbar.dart';
import 'package:wellnessz_app/utils/tools/validator/validation.dart';

import '../../../data/shared_preferences/local_storage_functions.dart';
import '../../../data/shared_preferences/storage_keys.dart';

class RegistrationController extends GetxController{

  RxBool isLightTheme = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController coachCodeController = TextEditingController();
  TextEditingController totalNumberOfClientsController = TextEditingController();
  TextEditingController organisations = TextEditingController();
  RxString totalNumberOfClients = "Select the Number of Clients".obs;
  RxString selectedOrganisations = "Organisations".obs;
  LoginRepository helper = LoginRepository();
  PageController pageController = PageController();
  final formKey = GlobalKey<FormState>();
  List numberOfClientsList =["1-10 Clients", "11-25 Clients", "26-50 Clients", "50+ Clients"];
  List organisationsList =["Herbalife", "Amway", "Nutritionists", "Others or Sole Profession as Wellness Coach"];

  selectNumberOfClients(val){
    totalNumberOfClients.value = val;
    totalNumberOfClientsController.text = val;
    update();
  }
  selectOrganisations(val){
    selectedOrganisations.value = val;
    organisations.text = val;
    update();
  }


  TextEditingController commonController(int index) {
    if (index==0) {
      return nameController;
    } else if (index==1) {
      return cityController;
    } else if (index==4){
      return coachCodeController;
    }
    return coachCodeController;
  }

  String hintText(int index) {
    if (index == 0) {
      return 'Name*';
    } else if (index == 1) {
      return 'City*';
    }
    return 'Coach Code(if any)';
  }

  String subHead(int index) {
    if (index == 0) {
      return 'sub_reg1'.tr;
    }  else if (index == 1) {
      return 'sub_reg3'.tr;
    }else if (index == 2) {
      return 'sub_reg4'.tr;
    }else if (index == 3) {
      return 'sub_reg6'.tr;
    }
    return 'sub_reg5'.tr;
  }

  String? validation(int index) {
    if (index == 0) {
      return StringValidator.validateUserName(nameController.text,'Name is required','Invalid User Name');
    } else if (index == 1) {
      return StringValidator.validateField(cityController.text, 'City is required');
    }else if(index==4){
      return null;
    }
    return null;
  }

  TextInputType inputType(TextEditingController controller){
    return TextInputType.text;
  }

  @override
  void onInit() {
    getThemeStatus();
    getArguments();
    super.onInit();
  }

  getArguments(){
    var arguments= Get.arguments;
    var name = arguments["name"];
    if(name!=null){
      nameController.text = name;
      update();
    }
}

  void onBack(val) {
    if(pageController.page==0){
      CustomDialogs.appDialog(
          title: "Warning !",subHead: "You will Lose all the Data and Need to start from Starting.",
        onClickYes: ()=>Get.offAllNamed(RouteName.introView)
      );
    }
    kDebugPrint("back called");
    pageController.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }


  void onContinue(int index)async {
    if (formKey.currentState!.validate()) {
      if (index == 4) {
        Map<String, dynamic> data = {
          "name": nameController.text,
          "organisation": organisations.text,
          "city": cityController.text,
          "coach_ref": coachCodeController.text,
          "total_number_of_clients": totalNumberOfClientsController.text,
          "person": "coach"
        };
        // await helper.coachRegister(data);
        Get.offAllNamed(RouteName.clientHomeView);
      } else {
        if (index == 2) {
          if (totalNumberOfClientsController.text
              .trim()
              .isNotEmpty) {
            pageController.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear);
          } else {
            CustomSnackBar.warningSnackBar(context: Get.context,
                message: "Select total Number of clients to Continue");
          }
        }
        else if (index == 3) {
          if (organisations.text
              .trim()
              .isNotEmpty) {
            pageController.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.linear);
          } else {
            CustomSnackBar.warningSnackBar(context: Get.context,
                message: "Select Organisation to Continue");
          }
        }else{
          pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear);
        }
      }
    }
  }

  getThemeStatus()async{
    isLightTheme.value = await getDataFromLocalStorage(dataType: StorageKey.boolType, prefKey: StorageKey.isLightTheme);
    update();
  }




}