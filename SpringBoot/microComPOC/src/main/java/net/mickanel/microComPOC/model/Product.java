package net.mickanel.microComPOC.model;

public class Product {
    private int id;
    private String nom;
    private String price;

    public Product() {
    }

    public Product(int id, String nom, String price) {
        this.id = id;
        this.nom = nom;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", price='" + price + '\'' +
                '}';
    }
}
