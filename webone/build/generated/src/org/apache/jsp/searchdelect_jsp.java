package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import databased.DbConnect;

public final class searchdelect_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <center>\n");
      out.write("\n");
      out.write("        ");

            String check = request.getParameter("check");
            boolean ispostback;
            if (check == null) {
                ispostback = false;
            } else {
                ispostback = true;
            }
            String option = "", sno = "", status = "", description = "", task = "", result = "";
            if (ispostback) {
                option = request.getParameter("option");
                sno = request.getParameter("sno");
                PreparedStatement ps = DbConnect.connect().prepareStatement("select * from ravi where sno=?");
                ps.setString(1, sno);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    task = "" + rs.getObject("task");
                    description = "" + rs.getObject("description");
                    status = "" + rs.getObject("status");
                }
            }
            if (option.equals("delete")) {
                out.println("delete code");
                sno = request.getParameter("sno");
                PreparedStatement ps = DbConnect.connect().prepareStatement("delete from ravi where sno=?");
                ps.setString(1, sno);
                int n = ps.executeUpdate();
                result = "delete" + n + "record";
            }

        
      out.write("\n");
      out.write("        <center>\n");
      out.write("            ");
      out.print(result);
      out.write("\n");
      out.write("           \n");
      out.write("                <h1>Hello boys delect & search my program !</h1>\n");
      out.write("                 <from method=\"post\">\n");
      out.write("                <input type=\"hidden\" name=\"check\"/>\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                sno<input value=\"%=sno%\"sno=\"sno\"type=\"number\">\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                task<input value=\"%=task%\"sno=\"task\"type=\"text\">\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                description<input value=\"%=description%\"sno=\"description\"type=\"text\">\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                status<input value=\"%=status%\"sno=\"status\"type=\"text\">\n");
      out.write("                <br>\n");
      out.write("                <br>\n");
      out.write("                <input type=\"submit\"name=\"option\"value=\"search\"/>\n");
      out.write("                <input type=\"submit\"name=\"option\"value=\"delect\"/>\n");
      out.write("\n");
      out.write("\n");
      out.write("            </from>\n");
      out.write("             </center>\n");
      out.write("            </body>\n");
      out.write("       \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
