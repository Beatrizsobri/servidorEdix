package com.ite.zapateria.modelo.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.zapateria.modelo.entities.ElementosCarrito;
import com.ite.zapateria.modelo.entities.Producto;
import com.ite.zapateria.modelo.entities.Usuario;
import com.ite.zapateria.repository.ElementosCarritoRepository;
import com.ite.zapateria.repository.ProductoRepository;
import com.ite.zapateria.repository.UsuarioRepository;

@Service
public class ElementosCarritoDaoImpl implements ElementosCarritoDao{
	@Autowired
	ElementosCarritoRepository listaElementosCarrito;
	
	@Autowired
	private ProductoRepository listaProductos;
	
	@Autowired
	private UsuarioRepository listaUsuarios;

	@Override
	public List<ElementosCarrito> porUsuario(int idUsuario) {
		return listaElementosCarrito.buscarPorUsuario(idUsuario);
	}

	@Override
	public ElementosCarrito añadirProducto(int idUsuario, int idProducto, int cantidad) {
		ElementosCarrito ec = getElementosCarrito(idUsuario, idProducto);
		if(ec == null) {
			Usuario usuario = listaUsuarios.getById(idUsuario);
			Producto producto = listaProductos.getById(idProducto);
			ec = new ElementosCarrito(usuario, producto);
		}
		if(ec.sumar(cantidad)<=0) {
			listaElementosCarrito.delete(ec);
		} else {
			listaElementosCarrito.save(ec);
		}
		return ec;
	}

	@Override
	public ElementosCarrito getElementosCarrito(int idUsuario, int idProducto) {
		return listaElementosCarrito.buscarPorUsuarioYProducto(idUsuario, idProducto);
	}
}
