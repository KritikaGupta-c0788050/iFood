/**
 * 
 */
package iFoodProject;

/**
 * @author kritikagupta
 *
 */
public class Food {
	int id;
	String food;
	double price;
	public Food() {}
		
	public Food(int id, String food, double price) {
		this.id = id;
		this.food = food;
		this.price = price;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
