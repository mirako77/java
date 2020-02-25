package net.mickanel.microComPOC.web.controller;

import net.mickanel.microComPOC.dao.ProductDAOImpl;
import net.mickanel.microComPOC.model.Product;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class ProductController {
    private static Logger logger = LoggerFactory.getLogger(ProductController.class);

    @Autowired
    private ProductDAOImpl productDao;

    @RequestMapping(value="/Produits", method= RequestMethod.GET)
    public List<Product> listeProduits() {
        return productDao.findAll();
    }

//  @RequestMapping(value = "/Produits/{id}", method = RequestMethod.GET)
//  public String afficherUnProduit(@PathVariable int id) {
//      return "Vous avez demandé un produit avec l'id  " + id;
//  }

//  Récupérer un produit a partir d'un GET
    @GetMapping(value = "/Produits/{id}")
    public Product afficherUnProduit(@PathVariable int id) {
        //Product product=new Product(id, new String("Aspirateur"), "500" );
        Product product = productDao.findById(id);
        logger.info("Appel WS afficherUnProduit:: " +product);
        return product;
    }

//  Ajouter un produit en POST
    @PostMapping(value = "/Produits")
    public void ajouterUnProduit(@RequestBody Product product) {
        productDao.save(product);
    }

}
