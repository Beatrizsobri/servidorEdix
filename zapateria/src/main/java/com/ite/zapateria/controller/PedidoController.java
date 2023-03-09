package com.ite.zapateria.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ite.zapateria.modelo.dao.DetallePedidoDao;
import com.ite.zapateria.modelo.dao.ElementosCarritoDao;
import com.ite.zapateria.modelo.dao.ProductoDao;
import com.ite.zapateria.modelo.dao.UsuarioDao;
import com.ite.zapateria.modelo.entities.ElementosCarrito;
import com.ite.zapateria.modelo.entities.Producto;

@RequestMapping("/pedidos")
@Controller
public class PedidoController {
	@Autowired
	private ProductoDao pdao;
	
	@Autowired
	private UsuarioDao udao;
	
	@Autowired
	private ElementosCarritoDao ecdao;
	
	@Autowired
	private DetallePedidoDao dpdao;
	
	@PostMapping("/addCarrito/{id}")
	public String cargarCarrito(Model model, RedirectAttributes rattr, @PathVariable("id") int idProducto, @RequestParam("cantidad") int cantidad, Principal principal, HttpSession session) {
		Producto producto = pdao.buscarUno(idProducto);
		int idUser = udao.buscarByEmail(principal.getName()).getIdUsuario();
		ElementosCarrito ec = ecdao.getElementosCarrito(idUser, idProducto);
		int yaEnCarrito = 0;
		if(ec!=null) {
			yaEnCarrito = ec.getCantidad();
		}

		if(producto.getStock()<(cantidad+yaEnCarrito)) {
			rattr.addFlashAttribute("mensaje", "ERROR! No hay stock suficiente.");
			return "redirect:/productos/detalle/"+idProducto;
		} else {	
			
			ecdao.añadirProducto(idUser, idProducto, cantidad);
			session.setAttribute("carrito", ecdao.porUsuario(idUser));

			rattr.addFlashAttribute("mensaje", "Añadido correctamente al carrito");
			return "redirect:/productos/detalle/"+idProducto;		
		}

	}
	
	@GetMapping("/detalle/{id}")
	public String pedidoDetalle(Model model, RedirectAttributes rattr, @PathVariable("id") int idPedido, Principal principal, HttpSession session) {
		/*Producto producto = pdao.buscarUno(idProducto);
		int idUser = udao.buscarByEmail(principal.getName()).getIdUsuario();
		ElementosCarrito ec = ecdao.getElementosCarrito(idUser, idProducto);
		int yaEnCarrito = 0;
		if(ec!=null) {
			yaEnCarrito = ec.getCantidad();
		}

		if(producto.getStock()<(cantidad+yaEnCarrito)) {
			rattr.addFlashAttribute("mensaje", "ERROR! No hay stock suficiente.");
			return "redirect:/productos/detalle/"+idProducto;
		} else {	
			
			ecdao.añadirProducto(idUser, idProducto, cantidad);
			session.setAttribute("carrito", ecdao.porUsuario(idUser));

			rattr.addFlashAttribute("mensaje", "Añadido correctamente al carrito");
			return "redirect:/productos/detalle/"+idProducto;		
		}*/
		
		model.addAttribute("pedido", dpdao.buscarPedido(idPedido) );
		return "pedidocliente";
	}
}