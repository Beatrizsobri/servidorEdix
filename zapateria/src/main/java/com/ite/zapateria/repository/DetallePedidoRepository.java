package com.ite.zapateria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ite.zapateria.modelo.entities.DetallesPedido;


public interface DetallePedidoRepository extends JpaRepository<DetallesPedido, Integer>{
	@Query("select d from DetallesPedido d where d.pedido.idPedido = ?1")
	public List<DetallesPedido> findByPedido(int idPedido);

}
