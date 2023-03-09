package com.ite.zapateria.modelo.entities;

import java.io.Serializable;
import javax.persistence.*;
/*import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;*/

@Entity
@Table(name="elementos_carrito")
public class ElementosCarrito implements Serializable  {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_carrito")
	private int idCarrito;

	@ManyToOne
	@JoinColumn(name = "id_usuario")
    Usuario usuario;

	@ManyToOne
	@JoinColumn(name = "id_producto")
    Producto producto;

	@Column(name="cantidad")
	int cantidad;

	public ElementosCarrito() {

	}

	public ElementosCarrito(Usuario usuario, Producto producto) {
		this.usuario = usuario;
		this.producto = producto;
		this.cantidad = 0;
	}

	public int sumar(int cantidad) {
		this.cantidad += cantidad;
		return this.cantidad;
	}

	public int getCantidad() {
		return this.cantidad;
	}

	public Producto getProducto() {
		return this.producto;
	}
}