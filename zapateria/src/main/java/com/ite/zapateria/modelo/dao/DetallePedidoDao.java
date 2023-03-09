package com.ite.zapateria.modelo.dao;

import java.util.List;

import com.ite.zapateria.modelo.entities.DetallesPedido;

public interface DetallePedidoDao {
	DetallesPedido buscarUno(int idPedido);
	List<DetallesPedido> buscarPedido(int idPedido);
}
