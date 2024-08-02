import 'product.dart';
import 'product_view.dart';

class ProductPresenter {
  final ProductView view;

  ProductPresenter(this.view);

  void showProductDetails(Product product) {
    view.displayProductDetails(product);
  }
}