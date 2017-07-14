# 数据库sql文档

### tip

app是application缩写

cmt是comment缩写

like是点赞

commit是提交

## ad 广告 
* title 标题
* content 内容
* startDate 开始日期
* endDate 截止日期
## chat_log 聊天记录 

* senderId 发送者id
* receiverId 接受者id
* time 发送时间
* content 发送内容
## follow 关注

* activeId 关注者id
* passiveId 被关注者id

## portfolio 作品 
* userId 作者id
* title 标题
* content 内容
* type 作品类型
* time 发布时间
* likes 点赞数量
* comments 评论数量
## portfolio_cmt 作品评论
* portfolioId 作品id
* content 评论内容
* userId 用户id
* time 发布时间
## portfolio_like 作品点赞

* userId 用户id
* portfolioId 作品id

## post 发贴
* type 发贴类型
* title 标题
* content　内容
* time 发贴时间
## post_cmt 贴子评论
* postid 帖子id
* content 评论内容
* time 评论时间
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
* projectId 项目id
* applicantId 申请者id
* content 申请内容
* time 申请时间
## project_commit 项目成果提交

* time 提交时间
* content 提交文字内容
* result 提交结果

## rating 评分

* posterId 项目发布者id
* contractorId 承包者id
* rate 评分

## report 举报

* portfolioId 举报作品id
* type 举报类型
* content 举报内容
* userId 举报者id
* time 举报时间
* result 举报结果

## tutorial 教程

- content 教程内容(html格式)
- type 教程类别

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
