# 数据库sql文档
## 前言
都省略了id  
app是application缩写
cmt是comment缩写

## ad 广告 
* title 标题
* content 内容
* startDate 开始日期
* endDate 截止日期
## chat_log 聊天记录 

`Rename`

* senderId 发送者id
* receiverId 接受者id
* time 发送时间
* content 发送内容
## portfolio 作品 
* userId 作者id
* title 标题
* content 内容
* type 作品类型
* likes 点赞数量
## portfolio_cmt 作品评论
* portfolioId 作品id
* content 评论内容
* floor 评论的第几楼
## post 发贴
* type 发贴类型
* title 标题
* content　内容
## post_cmt 发贴评论
* postid 帖子id
* content 评论内容
* floor 评论的第几楼
## project 项目
* posterId 发布者id
* contractorId 承包者id
* title 标题
* requirement 要求
* type 类型
* startDate 发布日期
* endDate 截止日期
* status 状态
* money 酬金
## project_app 项目申请
`New Table`

* projectId 项目id
* applicantId 申请者id
* content 申请内容
* time 申请时间戳
## user 用户 
* username 用户名
* password 密码
* email 邮箱
* ratingNumber 评分数量
* ratingTotal 总评分
* sex 性别
* birthday 生日
* role 角色
* money 余额

## tutorial 教程

`New Table`

* content 教程内容(html格式)
* type 教程类别