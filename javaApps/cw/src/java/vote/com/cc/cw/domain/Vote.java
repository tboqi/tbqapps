package com.cc.cw.domain;

import java.util.Date;

public class Vote {
	
	/** 资源类型枚举 */
	public enum ResourceType {
        Article(1, "article"), Channel(2, "channel");

        private int id;
        private String type;


        private ResourceType(int id, String type) {
            this.id = id;
            this. type = type;
        }

        public int getId() {
            return this.id;
        }

        public String getType() {
            return this.type;
        }

        public static ResourceType getInstance(int i) {
            for(ResourceType type : ResourceType.values()) {
                if(type.id == i) {
                    return type;
                }
            }
            throw new IllegalArgumentException("No such Type");
        }
    }
	
	/** 投票类型枚举 */
	public enum VoteCategory {
        Support(1, "Support"), UnSupport(2, "unSupport");

        private int id;
        private String category;


        private VoteCategory(int id, String category) {
            this.id = id;
            this. category = category;
        }

        public int getId() {
            return this.id;
        }

        public String getCategory() {
            return this.category;
        }

        public static VoteCategory getInstance(int i) {
            for(VoteCategory category : VoteCategory.values()) {
                if(category.id == i) {
                    return category;
                }
            }
            throw new IllegalArgumentException("No such category");
        }
    }
	

	private int id;
	
	private int memberId;
	
	/** 投票类型 */
//	private VoteCategory voteCategory;
	private String voteCategory;
	
	/** 会员投票日期 */
	private Date voteDate;
	
	/** 被投票资源id */
	private int resourceId;
	
	/** 被投票资源类型　*/
//	private ResourceType resourceType;
	private String resourceType;
	
	/** 投票数 */
	private int voteNumber;
	
	private String voteMember;
	
	public String getResourceType() {
		return resourceType;
	}

	public void setResourceType(String resourceType) {
		this.resourceType = resourceType;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getMemberId() {
		return memberId;
	}
	
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	public Date getVoteDate() {
		return voteDate;
	}
	
	public void setVoteDate(Date voteDate) {
		this.voteDate = voteDate;
	}
	
	public int getResourceId() {
		return resourceId;
	}
	
	public void setResourceId(int resourceId) {
		this.resourceId = resourceId;
	}

	public String getVoteCategory() {
		return voteCategory;
	}

	public void setVoteCategory(String voteCategory) {
		this.voteCategory = voteCategory;
	}

	public int getVoteNumber() {
		return voteNumber;
	}

	public void setVoteNumber(int voteNumber) {
		this.voteNumber = voteNumber;
	}

	public String getVoteMember() {
		return voteMember;
	}

	public void setVoteMember(String voteMember) {
		this.voteMember = voteMember;
	}
}
