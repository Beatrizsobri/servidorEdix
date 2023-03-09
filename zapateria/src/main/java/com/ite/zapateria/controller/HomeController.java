package com.ite.zapateria.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ite.zapateria.modelo.dao.ProductoDao;
import com.ite.zapateria.modelo.dao.UsuarioDao;
import com.ite.zapateria.modelo.entities.Producto;
import com.ite.zapateria.modelo.entities.Usuario;


@Controller
public class HomeController {
	@Autowired
	private ProductoDao listaProductos;
	@Autowired
	private UsuarioDao udao;
	
	@GetMapping("/")
	public String home(Model model) {			
		List<Producto> lista = listaProductos.buscarTodos();		
		model.addAttribute("listaProductos", lista);		
		return "/index";		 		
	}
	
	@GetMapping("/registrado")
	public String procesarLogin(Authentication aut, Model model, HttpSession misesion) {	
		Usuario usuario = udao.buscarByEmail(aut.getName());
		System.out.println("LOGIN ID ====== "+usuario.getIdUsuario());
		misesion.setAttribute("IDusuario", usuario.getIdUsuario());
		return "/index";
	}
	
	
}
