package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    private static List<Product> productList = new ArrayList<>();

    static {
        productList.add(new Product(1, "Iphone X", 1000, "Black", "Apple"));
        productList.add(new Product(2, "Iphone 11", 1500, "Red", "Apple"));
        productList.add(new Product(3, "Iphone 12", 2000, "White", "Apple"));
        productList.add(new Product(4, "Iphone 13", 3000, "Blue", "Apple"));
        productList.add(new Product(5, "Iphone 14", 4000, "Yellow", "Apple"));
    }

    @Override
    public List<Product> getAll() {
        return productList;
    }

    @Override
    public void saveProduct(Product product) {
        productList.add(product);
    }

    @Override
    public void delete(int id) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.remove(i);
            }
        }
    }

    @Override
    public void editProduct(Product product) {
        int id = product.getId();
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == id) {
                productList.set(i, product);
            }
        }
    }
}
