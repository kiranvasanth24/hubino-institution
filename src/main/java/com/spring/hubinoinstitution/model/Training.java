package com.spring.hubinoinstitution.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.EntityListeners;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@EntityListeners(AuditingEntityListener.class)
@Table(name = "training_details")
public class Training {
	@Id
	@GeneratedValue
	private int trainingId;
	private int userId;
	private String course;
	private String course_img;
	private String trainer_name;
	private String start_date;
	private String end_date;
	private String duration;
	private String reference;
	@Temporal(TemporalType.TIMESTAMP)
	@CreatedDate
	private Date created_datetime;
	@Temporal(TemporalType.TIMESTAMP)
	@LastModifiedDate
	private Date modified_datetime;
	private String description;
	private String is_deleted;
}
