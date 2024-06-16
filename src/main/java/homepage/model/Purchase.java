package homepage.model;

import java.sql.Date;

public class Purchase {
    private int purchaseNo;
    private Date purchaseDate;
    private String purchaseMeth;
    private String userId;
    private int totalPrice;

    public int getPurchaseNo() {
        return purchaseNo;
    }

    public void setPurchaseNo(int purchaseNo) {
        this.purchaseNo = purchaseNo;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getPurchaseMeth() {
        return purchaseMeth;
    }

    public void setPurchaseMeth(String purchaseMeth) {
        this.purchaseMeth = purchaseMeth;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
