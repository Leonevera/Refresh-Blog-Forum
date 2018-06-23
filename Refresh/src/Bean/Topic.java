package Bean;

import java.util.Date;

public class Topic {
	private int id;						//话题ID
	private String name;				//话题名称
	private String creator;				//话题创建者
	private String intro;				//话题简介
	private Date createtime;			//创建时间
	private int focusnum;				//关注人数
	private int articlenum;				//话题内文章数
	private int views;					//话题浏览量
	
	public int getID(){
		return id;
	}
	public void setID(int id){
		this.id = id;
	}
	public String getTopicName() {
		return name;
	}
	public void setTopicName(String name) {
		this.name = name;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getTopicIntro() {
		return intro;
	}
	public void setTopicIntro(String intro) {
		this.intro = intro;
	}
	public Date getCreateTime() {
		return createtime;
	}
	public void setCreateTime(Date time) {
		this.createtime = time;
	}
	public int getFocusNum() {
		return focusnum;
	}
	public void setFocusNum(int fnum) {
		this.focusnum = fnum;
	}
	public int getArticleNum() {
		return articlenum;
	}
	public void setArticleNum(int anum) {
		this.articlenum = anum;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
}
