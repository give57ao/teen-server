package com.ez.teen.chat.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.ez.teen.chat.model.ChatModel;
import com.ez.teen.follow.model.MemberFollowModel;

@Mapper
public interface ChatMapper {

	public ArrayList<ChatModel> message_list(ChatModel chatModel);
	
	public ArrayList<ChatModel> room_content_list(ChatModel chatModel);
	
	public int messageSendInlist(ChatModel chatModel);
	
	public int exist_chat(ChatModel chatModel);
	
	public int count_unread(ChatModel chatModel);
	
	public String get_other_profile(ChatModel chatModel);
	
	public int max_room(ChatModel chatModel);
	
	public int select_room(ChatModel chatModel);
	
	public void message_read_chk(ChatModel chatModel);
	
	public void insertChatAlarm(ChatModel chatModel);
	
	public void deleteChatAlarm(int alarm_no);
	
	public void deleteAllChatAlarm(ChatModel chatModel);
}
