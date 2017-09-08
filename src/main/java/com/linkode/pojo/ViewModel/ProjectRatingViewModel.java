package com.linkode.pojo.ViewModel;

import com.linkode.pojo.ProjectRating;

public class ProjectRatingViewModel {
	
		private Integer id;

	    private Integer projectId;

	    private Integer contractorId;

	    private Integer posterId;

	    private Integer rating;

	    private String content;
	    
	    private String posterName;
	    
	    private String projectName;

	    public ProjectRatingViewModel(ProjectRating projectRating) {
	    	this.id = projectRating.getId();
	    	this.projectId = projectRating.getProjectId();
	    	this.contractorId = projectRating.getContractorId();
	    	this.posterId = projectRating.getPosterId();
	    	this.rating = projectRating.getRating();
	    	this.content = projectRating.getContent();
	    }
	    
	    public Integer getId() {
	        return id;
	    }

	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public Integer getProjectId() {
	        return projectId;
	    }

	    public void setProjectId(Integer projectId) {
	        this.projectId = projectId;
	    }

	    public Integer getContractorId() {
	        return contractorId;
	    }

	    public void setContractorId(Integer contractorId) {
	        this.contractorId = contractorId;
	    }

	    public Integer getPosterId() {
	        return posterId;
	    }

	    public void setPosterId(Integer posterId) {
	        this.posterId = posterId;
	    }

	    public Integer getRating() {
	        return rating;
	    }

	    public void setRating(Integer rating) {
	        this.rating = rating;
	    }

	    public String getContent() {
	        return content;
	    }

	    public void setContent(String content) {
	        this.content = content;
	    }

		public String getPosterName() {
			return posterName;
		}

		public void setPosterName(String posterName) {
			this.posterName = posterName;
		}

		public String getProjectName() {
			return projectName;
		}

		public void setProjectName(String projectName) {
			this.projectName = projectName;
		}
}
