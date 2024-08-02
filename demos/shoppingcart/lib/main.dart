import 'product.dart';
import 'product_view.dart';
import 'product_presenter.dart';

class ConsoleProductView implements ProductView {
  @override
  void displayProductDetails(Product product) {
    print('Product Details:');
    print('ID: ${product.id}');
    print('Name: ${product.name}');
    print('Price: \$${product.price}');
  }
}

void main() {
  // Create a product
  var apple = Product(1, 'Apple', 0.5);

  // Create a view
  var view = ConsoleProductView();

  // Create a presenter
  var presenter = ProductPresenter(view);

  // Show product details
  presenter.showProductDetails(apple);
}