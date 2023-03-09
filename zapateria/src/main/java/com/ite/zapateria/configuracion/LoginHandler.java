package com.ite.zapateria.configuracion;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Service;

import com.ite.zapateria.modelo.dao.ElementosCarritoDao;
import com.ite.zapateria.modelo.dao.UsuarioDao;

@Service
public class LoginHandler implements AuthenticationSuccessHandler {
	@Autowired
	private UsuarioDao udao;
	
	@Autowired
	private ElementosCarritoDao ecdao;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		int idUser = udao.buscarByEmail(((User)authentication.getPrincipal()).getUsername()).getIdUsuario();
		request.getSession().setAttribute("carrito", ecdao.porUsuario(idUser));
		
		response.sendRedirect("/");
	}

}
