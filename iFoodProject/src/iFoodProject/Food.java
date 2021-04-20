/**
 * 
 */
package iFoodProject;

/**
 * @author kritikagupta
 *
 */
public class Food {
	
	String food;
	double price;
	public Food() {}
		
	public Food(int id, String food, double price) {
		this.food = food;
		this.price = price;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
}
