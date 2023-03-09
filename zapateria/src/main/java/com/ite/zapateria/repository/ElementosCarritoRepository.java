package com.ite.zapateria.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.ite.zapateria.modelo.entities.ElementosCarrito;

public interface ElementosCarritoRepository extends JpaRepository<ElementosCarrito, Integer>{
	@Query("select e from ElementosCarrito e where e.usuario.idUsuario=?1")
	public List<ElementosCarrito> buscarPorUsuario(int idUsuario);
	
	@Query("select e from ElementosCarrito e where e.usuario.idUsuario=?1 and e.producto.idProducto=?2")
	public ElementosCarrito buscarPorUsuarioYProducto(int idUsuario, int idProducto);
}
