
import 'package:get_it/get_it.dart';
import 'package:untitled/data/repo/api_repo/api_repo_imp.dart';
import 'package:untitled/ui/utilities/image_to_text_utilities.dart';
import 'package:untitled/ui/views/home/home_vm.dart';
import 'package:untitled/ui/views/register/register_vm.dart';

import 'data/repo/auth_repo/auth_repo.dart';
import 'data/repo/auth_repo/auth_repo_imp.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {


//Services
locator.registerSingleton<ImageToTextUtilities>(ImageToTextUtilities());

// Repos
locator.registerSingleton<AuthRepo>(AuthRepoImp());
locator.registerSingleton<ApiRepoImp>(ApiRepoImp());


// ViewModels
locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}