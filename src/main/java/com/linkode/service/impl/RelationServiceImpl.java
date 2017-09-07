package com.linkode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.linkode.dao.RelationMapper;
import com.linkode.pojo.Ad;
import com.linkode.pojo.Relation;
import com.linkode.pojo.RelationExample;
import com.linkode.service.RelationService;
import com.linkode.util.DataPage;

public class RelationServiceImpl implements RelationService {

	@Autowired
	RelationMapper relationMapper;

	@Override
	public int insert(Relation relation) {
		return relationMapper.insert(relation);
	}

	@Override
	public int update(Relation relation) {
		return relationMapper.updateByPrimaryKey(relation);
	}

	@Override
	public int deleteById(int id) {
		return relationMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Relation getById(int id) {
		return relationMapper.selectByPrimaryKey(id);
	}

	@Override
	public Relation getBy2UserId(int senderId, int receiverId) {
		RelationExample relationExample = new RelationExample();
		RelationExample.Criteria criteria = relationExample.createCriteria();
		criteria.andSenderIdEqualTo(senderId);
		criteria.andReceiverIdEqualTo(receiverId);
		List<Relation> relations = relationMapper.selectByExample(relationExample);
		if (relations.size()==0) {
			return null;
		}
		return relations.get(0);
	}

	@Override
	public void like(int senderId, int receiverId) {
		Relation relation = getBy2UserId(senderId, receiverId);
		if (relation == null) {
			relation = new Relation();
			relation.setReceiverId(receiverId);
			relation.setSenderId(senderId);
			relation.setLikes(1);
			relation.setMessages(0);
			relationMapper.insert(relation);
			return;
		}
		relation.setLikes(1);
		relationMapper.updateByPrimaryKey(relation);
	}

	@Override
	public Boolean hasLiked(int senderId, int receiverId) {
		Relation relation = getBy2UserId(senderId, receiverId);
		if (relation == null || relation.getLikes()==0) {
			return false;
		} 
		return true;
	}

	@Override
	public void dislike(int senderId, int receiverId) {
		Relation relation = getBy2UserId(senderId, receiverId);
		if (relation == null) {
			return;
		}
		relation.setLikes(0);
		relationMapper.updateByPrimaryKey(relation);
	}

	@Override
	public void sendMessage(int senderId, int receiverId) {
		Relation relation = getBy2UserId(senderId, receiverId);
		if (relation == null) {
			relation = new Relation();
			relation.setReceiverId(receiverId);
			relation.setSenderId(senderId);
			relation.setLikes(0);
			relation.setMessages(1);
			relationMapper.insert(relation);
			return;
		}
		relation.setMessages(relation.getMessages()+1);
		relationMapper.updateByPrimaryKey(relation);
	}

	@Override
	public void clearMessage(int senderId, int receiverId) {
		Relation relation = getBy2UserId(senderId, receiverId);
		if (relation == null) {
			return;
		}
		relation.setMessages(0);
		relationMapper.updateByPrimaryKey(relation);
	}
	
}
