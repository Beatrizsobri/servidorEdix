package com.ite.zapateria.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ite.zapateria.modelo.dao.DireccionDao;
import com.ite.zapateria.modelo.dao.PedidoDao;
import com.ite.zapateria.modelo.dao.RolDao;
import com.ite.zapateria.modelo.dao.TarjetaDao;
import com.ite.zapateria.modelo.dao.UsuarioDao;
import com.ite.zapateria.modelo.entities.Direccion;
import com.ite.zapateria.modelo.entities.Role;
import com.ite.zapateria.modelo.entities.Tarjeta;
import com.ite.zapateria.modelo.entities.Usuario;
@RequestMapping("/usuarios")
@Controller
public class UsuarioController {

	@Autowired
	UsuarioDao listaUsuarios;
	@Autowired
	RolDao listaRoles;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	DireccionDao listaDirecciones;
	@Autowired
	TarjetaDao listaTarjetas;
	@Autowired
	PedidoDao listaPedidos;
	
	@GetMapping("/clientes")
	public String listaCliente(Model model) {
		model.addAttribute("listaUsuarios", listaUsuarios.buscarTodos());
		return "clientes";
	}
	
	@GetMapping("/verficha/{id}")
	public String fichaCliente(Model model, @PathVariable ("id") int idUsuario) {
		Usuario usuario = listaUsuarios.buscarUsuario(idUsuario);

		model.addAttribute("cliente", usuario);
		model.addAttribute("listapedidos", listaPedidos.buscarPorUsuario(idUsuario));
		return "fichacliente";
	}
	
	
	
	@GetMapping("/registro/cliente")
	public String registroCliente(Model model) {
		model.addAttribute("mensaje", "Regístrese como nuevo cliente");
		model.addAttribute("action", "cliente");
		return "registrousuarios";
	}
	@GetMapping("/registro/administrador")
	public String registroAdministrador(Model model) {
		model.addAttribute("mensaje", "Registre un nuevo administrador");
		model.addAttribute("action", "administrador");
		return "registrousuarios";
	}
	@PostMapping("/alta/cliente")
	public String altaCliente(@RequestParam String nombre, @RequestParam String apellido,@RequestParam String password, 
			@RequestParam String email, @RequestParam String telefono, Model model, RedirectAttributes redirect) {
		
		String encriptado = passwordEncoder.encode(password);  
		Role rolCliente=listaRoles.buscarRol(2);
		Usuario usuario = new Usuario(0, apellido, email, 1, nombre, encriptado, telefono, rolCliente, null, null);
		
		if(listaUsuarios.altaUsuario(usuario)==null) {
			redirect.addFlashAttribute("info", "Cliente ya existe. No se puede dar de alta");
		}else {
			redirect.addFlashAttribute("info", "Cliente dado de alta correctamente, ya puede iniciar sesión");
		}
		
		return "redirect:/usuarios/registro/cliente";
	}
	@PostMapping("/alta/administrador")
	public String altaAdministrador(@RequestParam String nombre, @RequestParam String apellido,@RequestParam String password, 
			@RequestParam String email, @RequestParam String telefono, Model model, RedirectAttributes redirect) {
		
		Role rolAdministrador=listaRoles.buscarRol(1);
		Usuario usuario = new Usuario(0, apellido, email, 1, nombre, password, telefono, rolAdministrador, null, null);
		
		if(listaUsuarios.altaUsuario(usuario)==null) {
			redirect.addFlashAttribute("info", "Administrador ya existe. No se puede dar de alta");
		}else {
			redirect.addFlashAttribute("info", "Administrador dado de alta correctamente, ya puede iniciar sesión");
		}
		
		return "redirect:/usuarios/registro/administrador";
	}
	@GetMapping("/registro/direccion")
	public String registroDireccion() {

		
		return "registrodireccion";
	}
	
	@PostMapping("/registro/direccion")
	public String altaDireccion(@RequestParam String cp, @RequestParam String localidad,
			@RequestParam String calle, @RequestParam int numero, RedirectAttributes redirect, Principal principal) {
		
		Usuario usuario= listaUsuarios.buscarByEmail(principal.getName());
		Direccion direccion= new Direccion(0, calle, cp, localidad, numero);
		usuario.addDireccion(direccion);
		listaDirecciones.altaDireccion(direccion);
		redirect.addFlashAttribute("mensaje", "Nueva direccion añadida correctamente");
		
		return "redirect:/usuarios/registro/direccion";
	}
	@GetMapping("/registro/tarjeta")
	public String registroTarjeta() {
		
		return "registrotarjeta";
	}
	
	@PostMapping("/registro/tarjeta")
	public String altaTarjeta(@RequestParam String titular, @RequestParam int numero, RedirectAttributes redirect, Principal principal) {
		
		Usuario usuario= listaUsuarios.buscarByEmail(principal.getName());
		Tarjeta tarjeta = new Tarjeta(0, numero, titular);
		usuario.addTarjeta(tarjeta);
		listaTarjetas.altaTarjeta(tarjeta);
		redirect.addFlashAttribute("mensaje", "Nueva tarjeta añadida correctamente");
		
		return "redirect:/usuarios/registro/tarjeta";
	}
}
