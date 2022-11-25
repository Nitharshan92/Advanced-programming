package com.mycompany.techmart.dao;

import com.mycompany.techmart.entities.Delivery;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;


public class OrderDao {
    
    private SessionFactory factory;
    
    public OrderDao(SessionFactory factory){
    
        this.factory = factory;
    }
    
    public List<Delivery> getOrders(){
    
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Delivery");
        List<Delivery> list = query.list();
        return list;
    }
    
    public List<Delivery> getAllOrdersByEmail(String email){
    
        Session s = this.factory.openSession();
        Query query = s.createQuery("from Delivery where delivery_email =: email");
        query.setParameter("email", email);
        List<Delivery> list = query.list();
        return list;
    }
}
