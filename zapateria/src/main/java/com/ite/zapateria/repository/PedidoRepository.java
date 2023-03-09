package com.ite.zapateria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ite.zapateria.modelo.entities.Pedido;

public interface PedidoRepository extends JpaRepository<Pedido, Integer>{
	@Query("select p from Pedido p where p.usuario.idUsuario = ?1")
	public List<Pedido> findByUsuario(int idUsuario);
}
