package service.impl;

import model.Product;
import repository.IProductRepository;
import repository.impl.ProductRepository;
import service.IProductService;

import java.util.List;

public class ProductService implements IProductService {
    private static IProductRepository iProductRepository = new ProductRepository();

    @Override
    public List<Product> getAll() {
        List<Product> productList = iProductRepository.getAll();
        if (productList.size() == 0) {
            System.out.println("Không có dữ liệu");
            return null;
        } else {
            return productList;
        }
    }
    @Override
    public void saveProduct(Product product) {
        iProductRepository.saveProduct(product);
    }

    @Override
    public void delete(int id) {
        iProductRepository.delete(id);
    }

    @Override
    public void editProduct(Product product) {
        iProductRepository.editProduct(product);
    }
}
