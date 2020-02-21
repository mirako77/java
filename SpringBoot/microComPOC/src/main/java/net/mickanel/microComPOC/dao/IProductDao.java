package net.mickanel.microComPOC.dao;

import net.mickanel.microComPOC.model.Product;

import java.util.List;

public interface IProductDao {
    public List<Product>findAll();
    public Product findById(int id);
    public Product save(Product product);
}
