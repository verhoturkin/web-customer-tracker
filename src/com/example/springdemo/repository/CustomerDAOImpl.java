package com.example.springdemo.repository;


import com.example.springdemo.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

    private final SessionFactory sessionFactory;

    @Autowired
    public CustomerDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Customer> getCustomers() {
        //get session
        Session session = sessionFactory.getCurrentSession();
        //return query result list
        return session.createQuery("from Customer", Customer.class)
                      .getResultList();
    }

    @Override
    public void saveCustomer(Customer customer) {
        //get session
        Session session = sessionFactory.getCurrentSession();
        //save customer
        session.save(customer);
    }
}
