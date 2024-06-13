package homepage.controller;

import homepage.ConnectionPool;
import homepage.PooledConnection;
import homepage.process.CommandAction;
import homepage.vo.ProductVO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebInitParam;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.*;

@WebServlet(
        urlPatterns = {
                "*.do"
        },
        initParams = {
                @WebInitParam(name = "propertyConfig",
                value = "commandMapping.properties")
        })
public class Controller extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Map<String, Object> commandMap = new HashMap<>();
    public Controller() {
        super();
    }
    public void init(ServletConfig config) throws ServletException {
// initParams 에서 propertyConfig 의 값을 읽어옴 >> commandMapping.properties
        String props = config.getInitParameter("propertyConfig");
// properties 파일이 저장된 폴더
        String realFolder = "/property";
//웹어플리케이션 루트 경로
        ServletContext context = config.getServletContext();
//realFolder 를 웹어플리케이션 시스템상의 절대경로로 변경
        String realPath = context.getRealPath(realFolder) +"\\"+props;

//명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
        Properties pr = new Properties();
        try(FileInputStream fis = new FileInputStream(realPath)){
//command.properties 의 내용을 Properties 객체 pr 에 저장
            pr.load(fis);
        }catch (IOException e) {
            e.printStackTrace();
        }
//Set 객체의 iterator()메소드를 사용해 Iterator 객체를 얻어냄
        Iterator<?> keyIter = pr.keySet().iterator();
//Iterator 객체에 저장된 명령어와 처리클래스를 commandMap 에 저장
        while( keyIter.hasNext() ) {
            String command = (String)keyIter.next();
            String className = pr.getProperty(command);
            try{
                Class<?> commandClass = Class.forName(className);
//Object commandInstance = commandClass.newInstance();
                Object commandInstance = commandClass.getDeclaredConstructor().newInstance();
                commandMap.put(command, commandInstance);
            }catch (ClassNotFoundException e) {
                e.printStackTrace();
            }catch (InstantiationException e) {
                e.printStackTrace();
            }catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (IllegalArgumentException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            } catch (NoSuchMethodException e) {
                e.printStackTrace();
            } catch (SecurityException e) {
                e.printStackTrace();
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        requestPro(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        requestPro(request, response);
    }
    //웹브라우저의 요청을 분석하고, 해당 로직의 처리를 할 모델 실행 및
//처리 결과를 뷰에 보냄
    private void requestPro(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String view = null;
        CommandAction com = null;
        try {
            // http://localhost:9999/shoppingmall/XXX.do      ==   URL
// request.getRequestURI() = /shoppingmall/XXX.do == command
            // request.getContextPath() = /shoppingmall
            //    /XXX.do     == command
            String command = request.getRequestURI();
            if(command.indexOf(request.getContextPath()) == 0)
                command = command.substring(request.getContextPath().length());
            com = (CommandAction)commandMap.get(command);
            view = com.requestPro(request, response);
        }catch(Throwable e) {
            e.printStackTrace();
        }
        request.setAttribute("type", 1);
        //request.setAttribute("cont",view);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}