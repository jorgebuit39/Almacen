package Controlador;

import Modelo.Proveedores;
import Persistencia.DaoProveedores;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ControladorProveedores", urlPatterns = {"/ControladorProveedores"})
public class ControladorProveedores extends HttpServlet {

    int ide;  // Variable de instancia para almacenar el ID
    DaoProveedores daoProveedores = new DaoProveedores();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");

        switch (action) {
            case "registrar":
                registrarProveedores(request, response);
                break;

            case "listar":
                listarProveedores(request, response);
                break;

            case "editar":
                editarProveedores(request, response);
                break;

            case "editarProveedores":
                actualizarProveedores(request, response);
                break;

            case "buscarProveedores":
                buscarProveedores(request, response);
                break;

            case "eliminar":
                eliminarProveedores(request, response);
                break;

            default:
                // Handle any other actions or provide a default behavior
                break;
        }
    }

    //metodos
    private void registrarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            
            String nombres = request.getParameter("nombres");
            String telefono = request.getParameter("telefono");
            String domicilio = request.getParameter("domicilio");
            String correo = request.getParameter("correo");
            int documento = Integer.parseInt(request.getParameter("documento"));

            Proveedores proveedor = new Proveedores();

            proveedor.setNombres(nombres);
            proveedor.setTelefono(telefono);
            proveedor.setDomicilio(domicilio);
            proveedor.setCorreo(correo);
            proveedor.setDocumento_idDocumento(documento);

            if (daoProveedores.grabar(proveedor)) {
                request.setAttribute("mensaje", "El proveedor fue registrado correctamente");
            } else {
                request.setAttribute("mensaje", "El proveedor no fue registrado. Por favor, valide los campos ingresados.");
            }

            listarProveedores(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al registrar el proveedor");
            listarProveedores(request, response);
        }
    }

    private void listarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Proveedores> listaProveedores = daoProveedores.listar();
            request.setAttribute("listaProveedores", listaProveedores);
            request.getRequestDispatcher("Vistas/ListaProveedores.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al listar los proveedores");
            request.getRequestDispatcher("Vistas/ListaProveedores.jsp").forward(request, response);
        }
    }

    private void editarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Obtener el ID del parámetro de solicitud y almacenarlo en la variable de instancia
            ide = Integer.parseInt(request.getParameter("id"));
            Proveedores proveedor = daoProveedores.obtenerProveedoresPorId(ide);
            request.setAttribute("proveedor", proveedor);

            listarProveedores(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al editar el proveedor");
            listarProveedores(request, response);
        }
    }

    private void actualizarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Proveedores proveedor = new Proveedores();

            proveedor.setNombres(request.getParameter("nombres"));
            proveedor.setTelefono(request.getParameter("telefono"));
            proveedor.setDomicilio(request.getParameter("domicilio"));
            proveedor.setCorreo(request.getParameter("correo"));
            proveedor.setDocumento_idDocumento(Integer.parseInt(request.getParameter("documento")));
            proveedor.setIdProveedores(ide);

            boolean actualizacionExitosa = daoProveedores.editar(proveedor);

            if (actualizacionExitosa) {
                request.setAttribute("mensaje", "Proveedor actualizado correctamente");
            } else {
                request.setAttribute("mensaje", "No se pudo actualizar el proveedor");
            }

            listarProveedores(request, response);

        } catch (IOException | NumberFormatException | ServletException ex) {
            request.setAttribute("mensaje", "Error al actualizar el proveedor: " + ex.getMessage());
            listarProveedores(request, response);
        }
    }

    private void eliminarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int idProveedores = Integer.parseInt(request.getParameter("id"));

            if (daoProveedores.eliminar(idProveedores)) {
                request.setAttribute("mensaje", "El proveedor fue eliminado correctamente");
            } else {
                request.setAttribute("mensaje", "No se pudo eliminar el proveedor");
            }

            listarProveedores(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al eliminar el proveedor");
            listarProveedores(request, response);
        }
    }

    private void buscarProveedores(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String texto = request.getParameter("txtbuscar");
            List<Proveedores> listaProveedores = daoProveedores.buscarProveedores(texto);
            request.setAttribute("listaProveedores", listaProveedores);
            request.getRequestDispatcher("Vistas/ListaProveedores.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("mensaje", "Error al buscar los proveedores");
            request.getRequestDispatcher("Vistas/ListaProveedores.jsp").forward(request, response);
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
    }
}
