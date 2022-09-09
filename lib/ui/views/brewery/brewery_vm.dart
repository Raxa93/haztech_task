

import 'package:flutter/cupertino.dart';
import 'package:untitled/data/base/base_vm.dart';
import 'package:untitled/data/model/brewry_model.dart';
import 'package:untitled/data/repo/api_repo/api_repo_imp.dart';
import 'package:untitled/ui/constants/app_strings.dart';

import '../../../data/response/api_response.dart';
import '../../../locator.dart';

class BreweryVm extends BaseVm{

  final ApiRepoImp _repo = locator<ApiRepoImp>();
  List<BreweryModel> breweryList = [];
  ApiResponse<BreweryModel> breweryResponse = ApiResponse.loading();

  setBreweryList(ApiResponse<BreweryModel> response) {
    breweryResponse = response;
    notifyListeners();
  }

  Future<void> fetchBreweryList() async {

    setBreweryList(ApiResponse.loading());

    _repo.getGetApiResponse(AppUrls.baseUrl).then((value) {

      for(var element in value){
        // print('This is element i got ${elemnt}');
        breweryList.add(BreweryModel.fromJson(element));
      }
      debugPrint('This is length ${breweryList.length}');

      setBreweryList(ApiResponse.completed());

    }).onError((error, stackTrace)
    {
      setBreweryList(ApiResponse.error(error.toString()));
    });
  }



}