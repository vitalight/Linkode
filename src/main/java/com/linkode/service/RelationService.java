package com.linkode.service;

import com.linkode.pojo.Relation;

public interface RelationService {
	int insert(Relation relation);
	int update(Relation relation);
	int deleteById(int id);
	
	Relation getById(int id);
	Relation getBy2UserId(int senderId, int receiverId);
	
	void like(int senderId, int receiverId);
	void dislike(int senderId, int receiverId);
	Boolean hasLiked(int senderId, int receiverId);
	
	void sendMessage(int senderId, int receiverId);
	void clearMessage(int senderId, int receiverId);
}
