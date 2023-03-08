package com.ite.zapateria.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ite.zapateria.modelo.dao.ProductoDao;
import com.ite.zapateria.modelo.entities.Pedido;
import com.ite.zapateria.modelo.entities.Producto;

@RequestMapping("/pedidos")
@Controller
public class PedidoController {
	@Autowired
	private ProductoDao pdao;
	
	@PostMapping("/addCarrito/{id}")
	public String cargarCarrito(Model model, HttpSession misesion, RedirectAttributes rattr, @PathVariable("id") int idProducto, @RequestParam("cantidad") int cantidad) {
		Producto producto = pdao.buscarUno(idProducto);

		if(producto.getStock()<cantidad) {
			rattr.addFlashAttribute("mensaje", "ERROR! No hay stock suficiente.");
			return "redirect:/productos/detalle/"+idProducto;
		}else {	
			
			//obtenemos el id del usuario por session
			Integer idUser = (Integer) misesion.getAttribute("IDusuario");	
			System.out.println("ID user actual "+ idUser);
			///Pedido pedido = new Pedido(0, idUser, 0, 0, new Date(), "Carrito");

			rattr.addFlashAttribute("mensaje", "stock OK");
			return "redirect:/productos/detalle/"+idProducto;		
		}

	}
}
