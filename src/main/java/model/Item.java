package model;

import java.math.BigDecimal;

public class Item {
    private int id;
    private String name;
    private BigDecimal price;

    public Item() {}

    public Item(int id, String name, BigDecimal price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }

    public Item(String name, BigDecimal price) {
        this.name = name;
        this.price = price;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public BigDecimal getPrice() { return price; }

    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setPrice(BigDecimal price) { this.price = price; }
}
