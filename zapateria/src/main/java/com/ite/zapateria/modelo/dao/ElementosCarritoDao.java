package com.ite.zapateria.modelo.dao;

import java.util.List;

import com.ite.zapateria.modelo.entities.ElementosCarrito;

public interface ElementosCarritoDao {
	List<ElementosCarrito> porUsuario(int idUsuario);
	ElementosCarrito getElementosCarrito(int idUsuario, int idProducto);
	ElementosCarrito añadirProducto(int idUsuario, int idProducto, int cantidad);
}
