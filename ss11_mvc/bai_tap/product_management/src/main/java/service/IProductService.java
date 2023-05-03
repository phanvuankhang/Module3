package service;

import model.Product;

import java.util.List;

public interface IProductService {

    List<Product> getAll();

    void save(Product product);

    void delete(int productId);

    void edit(Product product);
}