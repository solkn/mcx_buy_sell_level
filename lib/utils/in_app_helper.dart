import 'package:in_app_purchase/in_app_purchase.dart';
import '../services/local_storage_service.dart';
export 'package:in_app_purchase/in_app_purchase.dart';


class _InAppHelper {
  Stream<List<PurchaseDetails>> get purchaseUpdates {
    return InAppPurchase.instance.purchaseStream;
    //return InAppPurchaseConnection.instance.purchaseUpdatedStream;
  }

  Future<bool> isAvailable() async {
    //return InAppPurchaseConnection.instance.isAvailable();
    return InAppPurchase.instance.isAvailable();
  }

  Future<List<ProductDetails>> getProdcutDetails() async {
    const Set<String> _kIds = {
      'mcxbslevels_pkg_30_days',
      'mcxbslevels_pkg_90_days',
      'mcxbslevels_pkg_180_days',
      'mcxbslevels_pkg_365_days'
    };
    final ProductDetailsResponse response = await InAppPurchase.instance.queryProductDetails(_kIds);
        //await InAppPurchaseConnection.instance.queryProductDetails(_kIds);
    if (response.notFoundIDs.isNotEmpty) {
      print('products not found');
    }
    return response.productDetails;
  }

  // Future<List<PurchaseDetails>> getPastPurchases() async {
  //   final 
  //   final QueryPurchaseDetailsResponse response =
  //       await InAppPurchaseConnection.instance.queryPastPurchases();
  //   if (response.error != null) {
  //     throw response.error;
  //   } else
  //     return response.pastPurchases;
  // }

  Future<void> consumePurchase(PurchaseDetails purchase) {
    //return InAppPurchaseConnection.instance.completePurchase(purchase);
    return InAppPurchase.instance.completePurchase(purchase);
  }

  Future<bool> buy(ProductDetails productDetails) async {
    final profile = await localStorageService.getProfile();

    return InAppPurchase.instance.buyConsumable(
      purchaseParam:  PurchaseParam(
        productDetails: productDetails,
        applicationUserName: profile.email,
      
      ),
      );
    // return InAppPurchaseConnection.instance.buyConsumable(
    //   purchaseParam: new PurchaseParam(
    //     productDetails: productDetails,
    //     applicationUserName: profile.email,
    //     sandboxTesting: true,
    //   ),
    // );
  }
}

final inAppHelper = _InAppHelper();
