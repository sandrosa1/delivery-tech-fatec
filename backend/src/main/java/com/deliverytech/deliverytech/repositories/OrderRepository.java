package com.deliverytech.deliverytech.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.deliverytech.deliverytech.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Long> {

}
