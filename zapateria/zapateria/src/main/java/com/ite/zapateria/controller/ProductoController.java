package com.ite.zapateria.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ite.zapateria.modelo.dao.ProductoDao;


@Controller
public class ProductoController {
	@Autowired
	private ProductoDao listaProductos;

	@GetMapping("/productos")
	public String buscarTodos(Model model){
		model.addAttribute("listaProductos", listaProductos.buscarTodos());
		return "productos";
	}
}
