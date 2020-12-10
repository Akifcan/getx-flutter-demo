import 'package:get/get.dart';
import 'package:get_app/models/cat_model.dart';
import 'package:get_app/services/remote_services.dart';

class CatController extends GetxController {
  RxList<CatModel> cats = List<CatModel>().obs;

  @override
  void onInit() {
    super.onInit();
    this.fetchCats();
  }

  void fetchCats() async {
    print('fetch');
    var catsResponse = await RemoteServices.fetchCats();
    if (catsResponse != null) {
      cats.assignAll(catsResponse);
    }
  }
}
