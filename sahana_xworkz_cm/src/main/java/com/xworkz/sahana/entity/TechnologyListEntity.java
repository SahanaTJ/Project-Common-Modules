package com.xworkz.sahana.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Table(name = "technology")
@NamedQuery(name = "list", query = "select entity from TechnologyListEntity entity where entity.id=:byId")
@Entity
public class TechnologyListEntity {

	@Id
	@Column(name = "stockId", unique = true, nullable = false)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long stockId;

	@Column(name = "id")
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "language")
	private String language;

	@Column(name = "version")
	private String version;

	@Column(name = "owner")
	private String owner;

	@Column(name = "support_from")
	private String supportFrom;

	@Column(name = "support_to")
	private String supportTo;

	@Column(name = "license")
	private String license;

	@Column(name = "open_source")
	private Boolean openSource;

	@Column(name = "OS_type")
	private String osType;

}
