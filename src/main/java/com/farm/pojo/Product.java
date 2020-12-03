package com.farm.pojo;

import java.util.List;

public class Product {
    private Integer id;
    private Integer cid;//分类id
    private Integer sid;//卖家id
    private String name;
    private Float price;
    private Integer stock;//库存
    private Integer scount;//起批量
    private String unit;//单位

    private ProductImage firstProductImage;
    private List<ProductImage> singleProductImage;//缩略图
    private List<ProductImage> detailProductImage;//详情图
    private int saleCount;//销量
    private int reviewCount;//累计评价
    private int priceCount;//价格条数


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getScount() {
        return scount;
    }

    public void setScount(Integer scount) {
        this.scount = scount;
    }

    public ProductImage getFirstProductImage() {
        return firstProductImage;
    }

    public void setFirstProductImage(ProductImage firstProductImage) {
        this.firstProductImage = firstProductImage;
    }

    public List<ProductImage> getSingleProductImage() {
        return singleProductImage;
    }

    public void setSingleProductImage(List<ProductImage> singleProductImage) {
        this.singleProductImage = singleProductImage;
    }

    public List<ProductImage> getDetailProductImage() {
        return detailProductImage;
    }

    public void setDetailProductImage(List<ProductImage> detailProductImage) {
        this.detailProductImage = detailProductImage;
    }

    public int getSaleCount() {
        return saleCount;
    }

    public void setSaleCount(int saleCount) {
        this.saleCount = saleCount;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    public int getPriceCount() {
        return priceCount;
    }

    public void setPriceCount(int priceCount) {
        this.priceCount = priceCount;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", cid=" + cid +
                ", sid=" + sid +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", scount=" + scount +
                ", firstProductImage=" + firstProductImage +
                '}';
    }
}
