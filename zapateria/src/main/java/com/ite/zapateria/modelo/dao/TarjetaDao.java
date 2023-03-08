package com.ite.zapateria.modelo.dao;

import com.ite.zapateria.modelo.entities.Tarjeta;

public interface TarjetaDao {
	Tarjeta altaTarjeta(Tarjeta tarjeta);
	Tarjeta buscarTarjeta(int idTarjeta);
}
