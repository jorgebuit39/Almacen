package Controlador;

import Modelo.Facturas;
import Persistencia.DaoFacturas;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorFacturas extends HttpServlet {

    Facturas fact = new Facturas();
    int ide;  // Variable de instancia para almacenar el ID

    //La variable serialVersionUID se utiliza en Java para asignar una versión única 
    //a una clase Serializable.
    //En este contexto, private static final long serialVersionUID = 1L; simplemente está estableciendo 
    //el serialVersionUID de la clase ControladorConsecutivo
    private static final long serialVersionUID = 1L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);

        String action = request.getParameter("accion");

        switch (action) {
            //   case "add":
            //  request.getRequestDispatcher("Vistas/RegistrarUsuarios.jsp").forward(request, response);//
            //  break;

            case "registrar":
                registrarFacturas(request, response);
                break;

            case "listar":
                listarFacturas(request, response);
                break;

            case "editar":
                editarFacturas(request, response);
                break;

            case "editarFacturas":
                actualizarFacturas(request, response);
                break;
                
                  case "buscar":
                buscarFacturas(request, response);
                break;

            case "eliminar":
                eliminarFacturas(request, response);
                break;

            default:
                // Handle any other actions or provide a default behavior
                break;
        }
    }

    private void registrarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int numeroOrden = Integer.parseInt(request.getParameter("numeroorden"));
            String fechaEntrada = (request.getParameter("fechaentrada"));
            int proveedores_idProveedores = Integer.parseInt(request.getParameter("proveedores"));
            int usuarios_idUsuarios = Integer.parseInt(request.getParameter("usuarios"));

            //int PerfilIdperfil = Integer.parseInt(request.getParameter("perfil_idPerfil"));
            Facturas facturas = new Facturas();

            facturas.setNumeroOrden(numeroOrden);
            facturas.setFechaEntrada(fechaEntrada);
            facturas.setProveedores_idProveedores(proveedores_idProveedores);
            facturas.setUsuarios_idUsuarios(usuarios_idUsuarios);

            if (DaoFacturas.grabar(facturas)) {
                request.setAttribute("mensaje", "la factura fue registrada");
            } else {
                request.setAttribute("mensaje", "la factura no fue registrada, validar campos ingresados");
            }

            List<Facturas> lt = DaoFacturas.listar();
            request.setAttribute("listaFacturas", lt);
            request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar el Consecutivo");
            listarFacturas(request, response);
        }
    }

    private void listarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Facturas> lt = DaoFacturas.listar();
            request.setAttribute("listaFacturas", lt);
            request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los Consecutivos");
            request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);
        }
    }

    private void editarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener el ID del parámetro de solicitud y almacenarlo en la variable de instancia
            ide = Integer.parseInt(request.getParameter("id"));
            Facturas f = DaoFacturas.obtenerFacturasPorId(ide);
            request.setAttribute("User", f);

            List<Facturas> lt = DaoFacturas.listar();
            request.setAttribute("listaFacturas", lt);
            request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al editar el Consecutivo");
            listarFacturas(request, response);
        }
    }

    private void actualizarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Utilizar la variable de instancia para obtener el ID
            Facturas f = DaoFacturas.obtenerFacturasPorId(ide);
            request.setAttribute("User", f);

            // Resto del código para actualizar el Consecutivo
            int numeroOrden = Integer.parseInt(request.getParameter("numeroorden"));
            String fechaEntrada = (request.getParameter("fechaentrada"));
            int proveedores_idProveedores = Integer.parseInt(request.getParameter("proveedores"));
            int usuarios_idUsuarios = Integer.parseInt(request.getParameter("usuarios"));

            //int txtid = Integer.parseInt(request.getParameter("txtid"));
            Facturas facturas = new Facturas();

            facturas.setNumeroOrden(numeroOrden);
            facturas.setFechaEntrada(fechaEntrada);
            facturas.setProveedores_idProveedores(proveedores_idProveedores);
            facturas.setUsuarios_idUsuarios(usuarios_idUsuarios);
            facturas.setIdFacturas(ide);

            boolean actualizacionExitosa = DaoFacturas.editar(facturas);

            if (actualizacionExitosa) {
                request.setAttribute("mensaje", "Consecutivo actualizado correctamente");
            } else {
                request.setAttribute("mensaje", "No se pudo actualizar el Consecutivo");
            }

            List<Facturas> lt = DaoFacturas.listar();
            request.setAttribute("listaFacturas", lt);
            request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al actualizar el Consecutivo: " + ex.getMessage());
            listarFacturas(request, response);
        }
    }

    private void eliminarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idFacturas= Integer.parseInt(request.getParameter("id"));

            if (DaoFacturas.eliminar(idFacturas)) {
                request.setAttribute("mensaje", "la factura fue Eliminado Correctamente");
            } else {
                request.setAttribute("mensaje", "No se pudo eliminar la factura");
            }

            List<Facturas> lt = DaoFacturas.listar();
            request.setAttribute("listaFacturas", lt);
            request.getRequestDispatcher("Vistas/ListarFacturas.jsp").forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al eliminar el Consecutivo");
            listarFacturas(request, response);
        }
    }
    
    
      private void buscarFacturas(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String texto = request.getParameter("txtbuscar");
            List<Facturas> lt = DaoFacturas.buscarFacturas(texto);
            request.setAttribute("listaFacturas", lt);
         request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al buscar los Consecutivos");
  request.getRequestDispatcher("Vistas/ListaFacturas.jsp").forward(request, response);
        }
    }
    
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
