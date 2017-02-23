package com.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "social_graph")
public class SocialLink implements Serializable {
	private static final long serialVersionUID = -1054352078130986642L;

	@Embeddable
	public class SocialLinkPK implements Serializable {
		private static final long serialVersionUID = 1L;
		
		public SocialLinkPK() {}

		public SocialLinkPK(int followerID, int followeeID) {
			super();
			this.followerID = followerID;
			this.followeeID = followeeID;
		}

		@Column(name = "follower_id")
		private int followerID;

		@Column(name = "followee_id")
		private int followeeID;

		public int getFollowerID() {
			return followerID;
		}

		public void setFollowerID(int followerID) {
			this.followerID = followerID;
		}

		public int getFolloweeID() {
			return followeeID;
		}

		public void setFolloweeID(int followeeID) {
			this.followeeID = followeeID;
		}

	}


	@EmbeddedId
	private SocialLinkPK pk;


	public SocialLink() {}


	public SocialLinkPK getPk() {
		return pk;
	}

	public void setPk(SocialLinkPK pk) {
		this.pk = pk;
	}



	

}
