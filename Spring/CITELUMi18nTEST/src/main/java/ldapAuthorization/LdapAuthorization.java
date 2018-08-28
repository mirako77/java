package ldapAuthorization;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import ghh.citelum.ProjectsController;
import ghh.citelum.utils.LoginCredentials;

/**
 * Servlet implementation class LdapAuthorization
 */
@WebServlet("/LdapAuthorization")
public class LdapAuthorization extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = Logger.getLogger(ProjectsController.class);
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LdapAuthorization() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    static void printAttrs(Attributes attrs) {
        if (attrs == null) {
          System.out.println("No attributes");
        } else {
          /* Print each attribute */
          try {
            for (NamingEnumeration<?> ae = attrs.getAll(); ae.hasMore();) {
              Attribute attr = (Attribute) ae.next();
              System.out.println("attribute: " + attr.getID());

              /* print each value */
              for (NamingEnumeration<?> e = attr.getAll(); e.hasMore(); System.out
                  .println("value: " + e.next()))
                ;
            }
          } catch (NamingException e) {
            e.printStackTrace();
          }
        }
      }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ADMIN PASSWORD:      uid=admin,ou=system
		
		//projectVersion.readProjectVersion(webAppPath);
		request.setCharacterEncoding("UTF-8");
		
				String yourName = request.getParameter("yourName");
				String yourPassword = request.getParameter("yourPassword");
				
				String admin = "admin";
				
				String loginName = "uid=admin,ou=system";
				
				String searchPath = "uid=" + yourName + ",ou=users,ou=system";
				
//				uid=admin,ou=users,ou=system
				// Set up environment for creating initial context
				Hashtable<String, Object> env = new Hashtable<String, Object>(11);
								

				try {

					/*

			

					if (yourName.equals("admin")) {
						System.out.println(yourName);
						yourName = "uid=admin,ou=system";
						System.out.println(yourName);
					}
					*/
/*			
// >>>>>>>>>>>>>>> LDAP authorization					
					
					env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
					env.put(Context.PROVIDER_URL, "ldap://localhost:10389");
					logger.info("begin LDAP connection authentication");

					// Authenticate as S. User and password "secret"
					env.put(Context.SECURITY_AUTHENTICATION, "simple");
					env.put(Context.SECURITY_PRINCIPAL, searchPath);
					env.put(Context.SECURITY_CREDENTIALS, yourPassword);


					// Create initial context
					DirContext ctx = new InitialDirContext(env);
					
					// Get all the attributes of named object
//				      Attributes answer = ctx.getAttributes(searchPath);
				      
				   // Print the answer
//				      printAttrs(answer);

					//System.out.println(ctx);

					//System.out.println(ctx.lookup("ou=system"));

					// do something useful with ctx

					// Close the context when we're done
					ctx.close();
					
// <<<<<<<<<<<<<<< LDAP authorization END	
*/
					LoginCredentials loginData = new LoginCredentials();
					String sessionId = request.getSession().getId();
					

					//loginData.setName("Juliano");
					loginData.setLogin(yourName);
					loginData.setPassword(yourPassword);

					loginData.setSessionId(sessionId);
					
					request.getSession().setAttribute("loginData", loginData);
					logger.info("LDAP authentication successfull");
					response.sendRedirect("login/checkLogin");
					//views/template/production/profile.jsp
					///api/profile
					
					/*
					PrintWriter writer = response.getWriter();
					writer.println("<h1>Hello " + yourName + " " + yourPassword + "</h1>");
					writer.close();
					*/
				

				} catch (/*NamingException*/ Exception e) {
//					logger.info("Authentication failed");
					
					
					request.setAttribute("loginFailed", true);
//					response.sendRedirect("web/unauthorized");
					

					RequestDispatcher rd = request.getRequestDispatcher("");
					rd.forward(request, response);
//					e.printStackTrace();
				}
				
				
	}

}
