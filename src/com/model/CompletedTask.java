package com.model;

import java.io.Serializable;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="completed_tasks")
public class CompletedTask {
	
	@Embeddable
	public static class CompletedTaskPK implements Serializable {
		private static final long serialVersionUID = 1L;
		
		@Column(name="user_id")
		private int userID;
		@Column(name="task_id")
		private int taskID;
		
		public CompletedTaskPK() {}

		public CompletedTaskPK(int userID, int taskID) {
			this.userID = userID;
			this.taskID = taskID;
		}

		public int getUserID() {
			return userID;
		}

		public void setUserID(int userID) {
			this.userID = userID;
		}

		public int getTaskID() {
			return taskID;
		}

		public void setTaskID(int taskID) {
			this.taskID = taskID;
		}
	}
	
	@Id
	private CompletedTaskPK pk;
	private Timestamp timestamp;
	
	public CompletedTask() {}
	public CompletedTask(CompletedTaskPK pk, Timestamp timestamp) {
		this.pk = pk;
		this.timestamp = timestamp;
	}
	public CompletedTaskPK getPk() {
		return pk;
	}
	public void setPk(CompletedTaskPK pk) {
		this.pk = pk;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
}
