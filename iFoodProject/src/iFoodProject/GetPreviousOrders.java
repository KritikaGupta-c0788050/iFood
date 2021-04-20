package iFoodProject;

public class GetPreviousOrders {
	String items;
	String quantities;
	int total;
	String username;
	String phone;
	String address;
	String payment_status;
	String time;
	String order_status;
	String email;
	
	GetPreviousOrders(){}
	GetPreviousOrders(String items,String quantities,int total,	String username,String phone,String address,String payment_status,String time,String order_status,String email){
		setItems(items);
		setQuantities(quantities);
		setTotal(total);
		setUsername(username);
		setPhone(phone);
		setAddress(address);
		setPayment_status(payment_status);
		setTime(time);
		setOrder_status(order_status);
		setEmail(email);
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	public String getQuantities() {
		return quantities;
	}
	public void setQuantities(String quantities) {
		this.quantities = quantities;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPayment_status() {
		return payment_status;
	}
	public void setPayment_status(String payment_status) {
		this.payment_status = payment_status;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getOrder_status() {
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
