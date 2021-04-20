/**
 * 
 */
package iFoodProject;

/**
 * @author kritikagupta
 *
 */
public class Product {

		String name;
		int  price;
		int quantity;
		int total;
		String img;
		
		Product() {}
		
		Product(String name, int price, int quantity, int total, String img){
			setName(name);
			setPrice(price);
			setQuantity(quantity);
			setTotal(total);
			setImg(img);
		}
		
		public String getImg() {
			return img;
		}

		public void setImg(String img) {
			this.img = img;
		}

		public int getPrice() {
			return price;
		}

		public void setPrice(int price) {
			this.price = price;
		}

		public int getTotal() {
			return total;
		}

		public void setTotal(int total) {
			this.total = total;
		}

		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		
		public String tostring() {
			return "Name: "+getName()+" Quantity: "+getQuantity()+" Price: "+getPrice()+" Total: "+getTotal();
			
		}
		
		
}

