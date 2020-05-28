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
        return session.createQuery("select c from Customer c order by c.lastName", Customer.class)
                      .getResultList();
    }

    @Override
    public Customer getCustomer(int id) {
        //get session
        Session session = sessionFactory.getCurrentSession();
        //get and return customer
        return session.get(Customer.class, id);
    }

    @Override
    public void deleteCustomer(int id) {
        //get session
        Session session = sessionFactory.getCurrentSession();
        //delete customer
        session.createQuery("delete from Customer where id=:customerId")
               .setParameter("customerId", id)
               .executeUpdate();
    }

    @Override
    public List<Customer> searchCustomers(String name) {
        //get session
        Session session = sessionFactory.getCurrentSession();

        if (name != null && !name.isBlank())
            return session.createQuery("select c from Customer c where c.lastName=:name " +
                                       "order by c.lastName", Customer.class)
                          .setParameter("name", name)
                          .getResultList();

        else
            return session.createQuery("select c from Customer c order by c.lastName", Customer.class)
                          .getResultList();
    }

    @Override
    public void saveCustomer(Customer customer) {
        //get session
        Session session = sessionFactory.getCurrentSession();
        //save customer
        session.saveOrUpdate(customer);
    }
}
