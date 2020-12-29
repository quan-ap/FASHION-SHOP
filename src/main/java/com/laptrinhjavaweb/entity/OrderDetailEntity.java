package com.laptrinhjavaweb.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "order_detail")
public class OrderDetailEntity extends BaseEntity{
	
	@ManyToOne
	@JoinColumn(name = "clothes_id")
	private ClothesEntity clothes;
	
	@ManyToOne
	@JoinColumn(name = "orders_id")
	private OrderEntity order;
	
	@Column(name = "quantity")
	private int quantity;
	
	@Column(name = "price")
	private Double price;
	
	@Column(name = "subtotal")
	private Double subtotal;
	
	public ClothesEntity getClothes() {
		return clothes;
	}
	public void setClothes(ClothesEntity clothes) {
		this.clothes = clothes;
	}
	public OrderEntity getOrder() {
		return order;
	}
	public void setOrder(OrderEntity order) {
		this.order = order;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Double getSubtotal() {
		return subtotal;
	}
	public void setSubtotal(Double subtotal) {
		this.subtotal = subtotal;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	
}
