package com.ez.teen.chat.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.teen.chat.model.ChatModel;
import com.ez.teen.chat.service.ChatService;

@Controller
public class ChatController {

	@Autowired
	ChatService chatService;

	@RequestMapping("/chatMainList")
	public String chatMainList(HttpServletRequest request, @RequestParam(value = "nick", required = false) String nick,
			ChatModel chatModel, HttpSession session, Model model) {

		String member_nick = (String) session.getAttribute("member_nick");

		chatModel.setMember_nick(member_nick);
		chatModel.setMember_nick(member_nick);

		chatModel.setSend_nick((String) session.getAttribute("member_nick"));
		chatModel.setRecv_nick(nick);
		if (nick != null) {
			int exist = chatService.exist_chat(chatModel);
			System.out.println("exist =" + exist);
			if (exist == 0) {
				chatService.messageSendInlist(chatModel);
			}
		}
		return "chat/chatMainList";
	}

	@RequestMapping("/chatList")
	public String chatList(HttpServletRequest request,

			ChatModel chatModel, HttpSession session) {

		String member_nick = (String) session.getAttribute("member_nick");

		chatModel.setMember_nick(member_nick);

		ArrayList<ChatModel> list = chatService.message_list(chatModel);
		request.setAttribute("chatlist", list);

		return "chat/chatList";
	}

	@RequestMapping("/contentList")
	public String contentList(HttpServletRequest request, ChatModel chatModel, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));

		chatModel.setRoom(room);
		chatModel.setMember_nick((String) session.getAttribute("member_nick"));

		ArrayList<ChatModel> clist = chatService.room_content_list(chatModel);

		request.setAttribute("clist", clist);

		return "chat/contentList";
	}

	@ResponseBody
	@RequestMapping("/messageSendList")
	public int messageSendList(@RequestParam int room, @RequestParam String other_nick, @RequestParam String content,
			HttpSession session, ChatModel chatModel) {

		chatModel.setRoom(room);
		chatModel.setSend_nick((String) session.getAttribute("member_nick"));
		chatModel.setRecv_nick(other_nick);
		chatModel.setContent(content);

		int flag = chatService.messageSendInlist(chatModel);
		chatService.insertChatAlarm(chatModel);
		return flag;
	}
	
	@RequestMapping("/deleteChatAlarm")
	@ResponseBody
	public int deleteFollowAlarm(@RequestParam("alarm_no") int alarm_no) {
		
		chatService.deleteChatAlarm(alarm_no);
		int result = 1;
		 return result;
	}
	
	@RequestMapping("/deleteAllChatAlarm")
	@ResponseBody
	public int deleteAllFollowAlarm(@RequestParam("nickname") String nickname, ChatModel chatModel) {
		
		chatModel.setMember_nick(nickname);
		
		chatService.deleteAllChatAlarm(chatModel);
		System.out.println("삭제 완료!!");
		int result = 1;

		 return result;
	}
}
