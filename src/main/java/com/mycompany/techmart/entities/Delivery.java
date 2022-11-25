package com.mycompany.techmart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Delivery{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length = 10, name = "delivery_id")
    private int deliveryId;
    @Column(length = 100, name = "delivery_name")
    private String deliveryName;
    @Column(length = 100, name = "delivery_email")
    private String deliveryEmail;
    @Column(length = 12, name = "delivery_phone")
    private String deliveryPhone;
    @Column(length = 1500, name = "delivery_address")
    private String deliveryAddress;
    @Column(length = 1500, name = "delivery_details")
    private String deliveryDetails;

    public Delivery(int deliveryId, String deliveryName, String deliveryEmail, String deliveryPhone, String deliveryAddress, String deliveryDetails) {
        this.deliveryId = deliveryId;
        this.deliveryName = deliveryName;
        this.deliveryEmail = deliveryEmail;
        this.deliveryPhone = deliveryPhone;
        this.deliveryAddress = deliveryAddress;
        this.deliveryDetails = deliveryDetails;
    }

    public Delivery(String deliveryName, String deliveryEmail, String deliveryPhone, String deliveryAddress, String deliveryDetails) {
        this.deliveryName = deliveryName;
        this.deliveryEmail = deliveryEmail;
        this.deliveryPhone = deliveryPhone;
        this.deliveryAddress = deliveryAddress;
        this.deliveryDetails = deliveryDetails;
    }

    public Delivery() {
    }

    public int getDeliveryId() {
        return deliveryId;
    }

    public void setDeliveryId(int deliveryId) {
        this.deliveryId = deliveryId;
    }

    public String getDeliveryName() {
        return deliveryName;
    }

    public void setDeliveryName(String deliveryName) {
        this.deliveryName = deliveryName;
    }

    public String getDeliveryEmail() {
        return deliveryEmail;
    }

    public void setDeliveryEmail(String deliveryEmail) {
        this.deliveryEmail = deliveryEmail;
    }

    public String getDeliveryPhone() {
        return deliveryPhone;
    }

    public void setDeliveryPhone(String deliveryPhone) {
        this.deliveryPhone = deliveryPhone;
    }

    public String getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(String deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public String getDeliveryDetails() {
        return deliveryDetails;
    }

    public void setDeliveryDetails(String deliveryDetails) {
        this.deliveryDetails = deliveryDetails;
    }

    @Override
    public String toString() {
        return "Delivery{" + "deliveryId=" + deliveryId + ", deliveryName=" + deliveryName + ", deliveryEmail=" + deliveryEmail + ", deliveryPhone=" + deliveryPhone + ", deliveryAddress=" + deliveryAddress + ", deliveryDetails=" + deliveryDetails + '}';
    }

        
}