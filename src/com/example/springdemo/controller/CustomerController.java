package com.example.springdemo.controller;

import com.example.springdemo.entity.Customer;
import com.example.springdemo.repository.CustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerDAO dao;

    @Autowired
    public CustomerController(CustomerDAO dao) {
        this.dao = dao;
    }

    @RequestMapping("/list")
    public String listCustomers(Model model) {
        //get all customers
        List<Customer> customers = dao.getCustomers();
        //add customers to model
        model.addAttribute("customers", customers);
        return "list-customers";
    }
}
