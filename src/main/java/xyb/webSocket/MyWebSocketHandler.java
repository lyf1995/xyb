/*package xyb.webSocket;

import com.google.gson.Gson;

import xyb.entity.Contact;
import xyb.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.*;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Component
public class MyWebSocketHandler implements WebSocketHandler{
	@Autowired
    private UserService userService;
	
	//当MyWebSocketHandler类被加载时就会创建该Map，随类而生
    public static final Map<Integer, WebSocketSession> userSocketSessionMap;

    static {
        userSocketSessionMap = new HashMap<Integer, WebSocketSession>();
    }
    
    //握手实现连接后
    public void afterConnectionEstablished(WebSocketSession webSocketSession) throws Exception {
        int userId = (Integer) webSocketSession.getAttributes().get("userId");
        if (userSocketSessionMap.get(userId) == null) {
            userSocketSessionMap.put(userId, webSocketSession);
        }
    }
    
    //发送信息前的处理
    public void handleMessage(WebSocketSession webSocketSession, WebSocketMessage<?> webSocketMessage) throws Exception {
    	if(webSocketMessage.getPayloadLength()==0)return;
    	
        //得到Socket通道中的数据并转化为Message对象
    	TextMessage returnMessage = new TextMessage(webSocketMessage.getPayload()+"");  
    	Contact contact=new Gson().fromJson(webSocketMessage.getPayload().toString(),Contact.class);
    	System.out.println("接收到前端发送过来的数据:" + returnMessage);

    	Contact contact=new Contact();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String timeStr=simpleDateFormat.format(new Date());
		contact.setTimeStr(timeStr);
		Date date = null;
		try {
			date = simpleDateFormat.parse(timeStr);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		int time = (int) (date.getTime()/1000);
		contact.setTime(time);
        //将信息保存至数据库
        userService.addContact(contact);

        //发送Socket信息
        sendMessageToUser(msg.getToId(), new TextMessage(new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create().toJson(msg)));
    }

    public void handleTransportError(WebSocketSession webSocketSession, Throwable throwable) throws Exception {

    }
    
    public void afterConnectionClosed(WebSocketSession webSocketSession, CloseStatus closeStatus) throws Exception {

        System.out.println("WebSocket:"+webSocketSession.getAttributes().get("userId")+"close connection");
        Iterator<Map.Entry<Integer,WebSocketSession>> iterator = userSocketSessionMap.entrySet().iterator();
        while(iterator.hasNext()){
            Map.Entry<Integer,WebSocketSession> entry = iterator.next();
            if(entry.getValue().getAttributes().get("userId")==webSocketSession.getAttributes().get("userId")){
                userSocketSessionMap.remove(webSocketSession.getAttributes().get("userId"));
                System.out.println("WebSocket in staticMap:" + webSocketSession.getAttributes().get("userId") + "removed");
            }
        }
    }
    
    public boolean supportsPartialMessages() {
        return false;
    }

    //发送信息的实现
    public void sendMessageToUser(int userId, TextMessage message)
            throws IOException {
        WebSocketSession session = userSocketSessionMap.get(userId);
        if (session != null && session.isOpen()) {
            session.sendMessage(message);
        }
    }
}
*/