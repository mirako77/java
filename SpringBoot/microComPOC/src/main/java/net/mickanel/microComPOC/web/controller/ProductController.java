package net.mickanel.microComPOC.web.controller;

import net.mickanel.microComPOC.model.Product;
import org.springframework.web.bind.annotation.*;

@RestController
public class ProductController {

    @RequestMapping(value="/Produits", method= RequestMethod.GET)
    public String listeProduits() {
        return "Un exemple de produit";
    }

//    @RequestMapping(value = "/Produits/{id}", method = RequestMethod.GET)
//    public String afficherUnProduit(@PathVariable int id) {
//        return "Vous avez demandé un produit avec l'id  " + id;
//    }

    @GetMapping(value = "/Produits/{id}")
    public Product afficherUnProduit(@PathVariable int id) {
        Product product=new Product(id, new String("Aspirateur"), "500" );
        return product;
    }
}
