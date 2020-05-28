package com.example.springdemo.controller;

import com.example.springdemo.entity.Customer;
import com.example.springdemo.repository.CustomerDAO;
import com.example.springdemo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    private final CustomerService customerService;

    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/list")
    public String listCustomers(Model model) {
        //add customers to model
        model.addAttribute("customers", customerService.getCustomers());
        return "list-customers";
    }
}
