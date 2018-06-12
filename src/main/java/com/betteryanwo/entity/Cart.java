package com.betteryanwo.entity;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

/**
 * Create by 六
 * Date:18-5-31
 * 购物车
 */
public class Cart {
    private Long id;    //购物车ID
    private List<CartItem> cartItems;   //购物车项
    /*商品总价*/
    private BigDecimal price;
    /*所属用户*/
    private Long userId;
    /*状态*/
    private Integer status;
    /*创建时间*/
    private Date dateCreated;
    /*更新时间*/
    private Date dateUpdated;
    /*备注*/
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<CartItem> getCartItems() {
        return cartItems;
    }

    public void setCartItems(List<CartItem> cartItems) {
        this.cartItems = cartItems;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public Date getDateUpdated() {
        return dateUpdated;
    }

    public void setDateUpdated(Date dateUpdated) {
        this.dateUpdated = dateUpdated;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", cartItems=" + cartItems +
                ", price=" + price +
                ", userId=" + userId +
                ", status=" + status +
                ", dateCreated=" + dateCreated +
                ", dateUpdated=" + dateUpdated +
                ", description='" + description + '\'' +
                '}';
    }
}
