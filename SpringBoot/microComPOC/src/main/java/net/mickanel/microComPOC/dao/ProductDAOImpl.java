package net.mickanel.microComPOC.dao;

import net.mickanel.microComPOC.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductDAOImpl implements IProductDao {

    public static List<Product>products=new ArrayList<>();

    static {
        products.add(new Product(1, "Ordinateur portable", "450"));
        products.add(new Product(2, "Aspirateur Robot", "500"));
        products.add(new Product(3, "Galaxy Note 10", "1150"));
    }

    @Override
    public List<Product> findAll() {
        return products;
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void save(Product product) {

    }
}
