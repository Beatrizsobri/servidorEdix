package com.ite.zapateria.modelo.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ite.zapateria.modelo.entities.Tarjeta;
import com.ite.zapateria.repository.TarjetaRepository;

@Service
public class TarjetaDaoImpl implements TarjetaDao{
	
	@Autowired
	TarjetaRepository listaTarjetas;

	@Override
	public Tarjeta altaTarjeta(Tarjeta tarjeta) {
		// TODO Auto-generated method stub
		if(buscarTarjeta(tarjeta.getIdTarjeta())==null)
			return listaTarjetas.save(tarjeta);
		return null;
	}

	@Override
	public Tarjeta buscarTarjeta(int idTarjeta) {
		// TODO Auto-generated method stub
		return listaTarjetas.findById(idTarjeta).orElse(null);
	}

}
