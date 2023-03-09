package com.ite.zapateria.modelo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.zapateria.modelo.entities.DetallesPedido;
import com.ite.zapateria.repository.DetallePedidoRepository;



@Service
public class DetallePedidoDaoImpl implements DetallePedidoDao{
	
	@Autowired
	private DetallePedidoRepository listaPedido;
	 
	@Override
	public DetallesPedido buscarUno(int idPedido) {
		// TODO Auto-generated method stub
		return listaPedido.findById(idPedido).orElse(null);
	}
	
	@Override
	public List<DetallesPedido> buscarPedido(int idPedido) {
		// TODO Auto-generated method stub
		return listaPedido.findByPedido(idPedido);
	}

	
}
