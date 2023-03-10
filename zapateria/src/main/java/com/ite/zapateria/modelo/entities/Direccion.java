package com.ite.zapateria.modelo.entities;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the direcciones database table.
 * 
 */
@Entity
@Table(name="direcciones")
@NamedQuery(name="Direccion.findAll", query="SELECT d FROM Direccion d")
public class Direccion implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_direccion")
	private int idDireccion;

	private String calle;

	@Column(name="codigo_postal")
	private String codigoPostal;

	private String localidad;

	private int numero;

	public Direccion() {
	}

	public int getIdDireccion() {
		return this.idDireccion;
	}

	public void setIdDireccion(int idDireccion) {
		this.idDireccion = idDireccion;
	}

	public String getCalle() {
		return this.calle;
	}

	public void setCalle(String calle) {
		this.calle = calle;
	}

	public String getCodigoPostal() {
		return this.codigoPostal;
	}

	public void setCodigoPostal(String codigoPostal) {
		this.codigoPostal = codigoPostal;
	}

	public String getLocalidad() {
		return this.localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public int getNumero() {
		return this.numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + idDireccion;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!(obj instanceof Direccion))
			return false;
		Direccion other = (Direccion) obj;
		if (idDireccion != other.idDireccion)
			return false;
		return true;
	}

	public Direccion(int idDireccion, String calle, String codigoPostal, String localidad, int numero) {
		super();
		this.idDireccion = idDireccion;
		this.calle = calle;
		this.codigoPostal = codigoPostal;
		this.localidad = localidad;
		this.numero = numero;
	}

}