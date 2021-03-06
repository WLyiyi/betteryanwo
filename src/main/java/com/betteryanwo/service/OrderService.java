package com.betteryanwo.service;

import com.betteryanwo.entity.Order;

/**
 * Create by 六
 * Date:18-6-8
 */
public interface OrderService {
    /**
     * 添加订单
     * @param userId 用户
     * @param orderSerial 订单序列号（可为null）
     * @param isInvoice
     * @return
     */
    Order insert(Long userId, String orderSerial, Integer isInvoice);

    /**
     * 修改订单的状态
     * @param order
     * @return
     */
    int updateOrder(Order order);

    /**
     * 根据订单号删除订单
     * @param orderSerial
     * @return
     */
    int deleteOrder(Long orderId,String orderSerial);

    /**
     * 根据订单序列号查询订单
     * @param orderSerial 订单序列号
     * @return
     */
    Order getOrderByOrderSerial(String orderSerial);

    /**
     * 根据用户ID和订单ID查询订单
     * @param userId
     * @param orderSerial
     * @return
     */
    Order getByUserIdAndOrderSerial(Long userId,String orderSerial);

}
