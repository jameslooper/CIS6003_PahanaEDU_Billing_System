package model;

public class Customer {
    private int accountNo;
    private String name;
    private String address;
    private String telephone;
    private int units;

    public Customer() {}

    public Customer(int accountNo, String name, String address, String telephone, int units) {
        this.accountNo = accountNo;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
        this.units = units;
    }

    public int getAccountNo() { return accountNo; }
    public String getName() { return name; }
    public String getAddress() { return address; }
    public String getTelephone() { return telephone; }
    public int getUnits() { return units; }

    public void setAccountNo(int accountNo) { this.accountNo = accountNo; }
    public void setName(String name) { this.name = name; }
    public void setAddress(String address) { this.address = address; }
    public void setTelephone(String telephone) { this.telephone = telephone; }
    public void setUnits(int units) { this.units = units; }
}
