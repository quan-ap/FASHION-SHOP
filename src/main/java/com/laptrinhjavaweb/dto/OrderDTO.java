package com.laptrinhjavaweb.dto;

public class OrderDTO extends AbstractDTO<OrderDTO>{
	
	private String address;
	private Integer status;
	private Double total;
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
}
